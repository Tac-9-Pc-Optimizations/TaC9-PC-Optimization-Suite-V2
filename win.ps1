#requires -Version 5.1
[CmdletBinding()]
param(
    [string]$DestinationDirectory = [Environment]::GetFolderPath('Desktop')
)

# Keep preferences and helper variables out of the caller's session when used via iex.
& {
    param([string]$Directory)
    Set-StrictMode -Version 2.0
    $ErrorActionPreference = 'Stop'
    $ProgressPreference = 'SilentlyContinue'
    function Get-TaC9FileSha256 {
        param([Parameter(Mandatory=$true)][string]$Path)
        $stream = $null
        $sha = $null
        try {
            $stream = [IO.File]::Open($Path, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::Read)
            $sha = [Security.Cryptography.SHA256]::Create()
            return [BitConverter]::ToString($sha.ComputeHash($stream)).Replace('-', '')
        } finally {
            try { if ($null -ne $sha) { $sha.Dispose() } }
            finally { if ($null -ne $stream) { $stream.Dispose() } }
        }
    }

    function Get-TaC9FreshManifest {
        param([Parameter(Mandatory=$true)][uri]$Uri)
        if ($Uri.Scheme -ne 'https') { throw 'The update manifest must use HTTPS.' }
        for ($attempt = 0; $attempt -lt 2; $attempt++) {
            $currentUri = $Uri
            $timer = [Diagnostics.Stopwatch]::StartNew()
            try {
                for ($redirects = 0; $redirects -le 5; $redirects++) {
                    if ($currentUri.Scheme -ne 'https') { throw 'The update manifest redirect must use HTTPS.' }
                    $requestUri = New-Object UriBuilder($currentUri)
                    # GitHub drops queries when redirecting latest/download.
                    # Refresh each same-origin hop, preserving signed asset queries.
                    if ($currentUri.Authority -eq $Uri.Authority) {
                        $query = $requestUri.Query.TrimStart('?')
                        $requestUri.Query = $(if ($query) { $query + '&' } else { '' }) + 'tac9_check=' + [guid]::NewGuid().ToString('N')
                    }
                    $requestUri.Fragment = ''
                    $remainingSeconds = [int][Math]::Ceiling(15 - $timer.Elapsed.TotalSeconds)
                    if ($remainingSeconds -le 0) { throw [Net.WebException]::new('The update manifest request timed out.', [Net.WebExceptionStatus]::Timeout) }
                    $requestErrors = @()
                    # Windows PowerShell returns a usable redirect plus a
                    # nonterminating error when MaximumRedirection is zero.
                    $response = Invoke-WebRequest -UseBasicParsing -Uri $requestUri.Uri.AbsoluteUri -Headers @{
                        'Cache-Control' = 'no-cache, no-store, max-age=0'
                        'Pragma' = 'no-cache'
                    } -MaximumRedirection 0 -TimeoutSec $remainingSeconds -ErrorAction SilentlyContinue -ErrorVariable requestErrors
                    if ($null -eq $response) {
                        if ($requestErrors.Count) { throw $requestErrors[0] }
                        throw 'The update manifest request returned no response.'
                    }
                    $statusCode = [int]$response.StatusCode
                    if ($statusCode -in @(301, 302, 303, 307, 308)) {
                        if ($redirects -ge 5) { throw 'The update manifest exceeded the redirect limit.' }
                        $location = [string]$response.Headers['Location']
                        if ([string]::IsNullOrWhiteSpace($location)) { throw 'The update manifest redirect has no destination.' }
                        $currentUri = New-Object Uri($requestUri.Uri, $location)
                        continue
                    }
                    if ($statusCode -ne 200) { throw "The update manifest returned HTTP $statusCode." }
                    return $response
                }
            } catch {
                $failure = $_.Exception
                $retryable = $false
                if ($failure -is [Net.WebException]) {
                    $retryable = [string]$failure.Status -in @('Timeout', 'ConnectFailure', 'ConnectionClosed', 'NameResolutionFailure', 'ProxyNameResolutionFailure', 'ReceiveFailure', 'SendFailure', 'KeepAliveFailure')
                }
                try {
                    $statusCode = [int]$failure.Response.StatusCode
                    if ($statusCode -in @(408, 429, 500, 502, 503, 504)) { $retryable = $true }
                } catch {}
                if ($attempt -ge 1 -or -not $retryable) { throw }
                Start-Sleep -Milliseconds 750
            }
        }
    }

    function Assert-TaC9SignedManifest {
        param([Parameter(Mandatory=$true)]$Manifest, [Parameter(Mandatory=$true)][string]$PublicKeyXml)
        foreach ($name in @('schema_version', 'version', 'package_url', 'sha256', 'published_at', 'signature')) {
            if ($null -eq $Manifest.PSObject.Properties[$name] -or [string]::IsNullOrWhiteSpace([string]$Manifest.$name)) {
                throw "Release information is missing: $name"
            }
        }
        if ($Manifest.schema_version -ne 1 -or [string]$Manifest.sha256 -notmatch '^[A-Fa-f0-9]{64}$') { throw 'The release information has an unsupported format.' }
        [void][version]::Parse([string]$Manifest.version)
        $canonical = '{0}|{1}|{2}|{3}' -f $Manifest.version, $Manifest.package_url, $Manifest.sha256, $Manifest.published_at
        $rsa = New-Object Security.Cryptography.RSACryptoServiceProvider
        try {
            $rsa.PersistKeyInCsp = $false
            $rsa.FromXmlString($PublicKeyXml)
            if (-not $rsa.VerifyData([Text.Encoding]::UTF8.GetBytes($canonical), 'SHA256', [Convert]::FromBase64String([string]$Manifest.signature))) {
                throw 'The release signature is invalid. Nothing will be downloaded.'
            }
        } finally { $rsa.Dispose() }
        $packageUrl = [uri]([string]$Manifest.package_url)
        $allowedPath = '^/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/download/(?:v\d+(?:\.\d+){2,3}/TaC9-PC-Optimization-Suite-V[23]\.exe|v13\.0\.9/TaC9-PC-Optimization-Suite-V3-r[123456789]\.exe|v13\.0\.10/TaC9-PC-Optimization-Suite-V3-r[123]\.exe)$'
        # This query is part of the signed manifest. Accept only the exact
        # signed build version; older releases may have no query.
        $allowedQuery = [string]::IsNullOrEmpty($packageUrl.Query) -or $packageUrl.Query -ceq ('?tac9_build=' + [string]$Manifest.version)
        if (-not $packageUrl.IsAbsoluteUri -or $packageUrl.Scheme -ne 'https' -or $packageUrl.Host -ne 'github.com' -or
            $packageUrl.Port -ne 443 -or $packageUrl.UserInfo -or -not $allowedQuery -or $packageUrl.Fragment -or
            $packageUrl.AbsolutePath -cnotmatch $allowedPath) { throw 'The signed download URL is not an official TaC9 suite release.' }
    }
    $assetName = 'TaC9-PC-Optimization-Suite-V2.exe'
    $manifestUrl = 'https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/latest/download/manifest-v2.json'
    # Public verification key only. The private signing key is never distributed.
    $publicKey = '<RSAKeyValue><Modulus>o/eq8qWnibwa1E+DpZdlI3ssXslY18+MgYMM5eRir3M8LG3iD70stzDYEzkyOZggHVdGgb7dH6j3eUAFFpITwqF5ygiSzxQvFji0hZoVFrzjHHwsNSt6Wivbs483gBgRoCbuynjjFWuoknIAoOdwkvNpS5xMNxTJOjSlBEQ/pYpUTLTQZYzBlsMNwpECs2pVO6Atw5/K/Q549vlduww9obNS4YQ4pr2ieVXN6foDJUxPhMnqN3u689+IVePmeixaszjjeNRZCEfKFmGjxtvurdbxhkKiex9y6SUfOvpHLy1l2QodJhZDITYStx1r8AwCAAVSoFRCpnEip3T9Ai6oTk84BbP7RBdlq97rVL1QIJ08wewqHsHmfGLojiAEmC/+K9qhLVVQZ/mmquAi+w6I3+L6HLSOoPK2kz8wADYlSIucYT1RlZfHbd/fR/j6s+dOrUFfiZ6+nmcfjgjEal3L61BqOTdd0d7Fk3ISqZb+9csqNNjVV3XeiZiWu1+P/zH1</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>'
    $oldProtocol = [Net.ServicePointManager]::SecurityProtocol
    $temporary = $null
    try {
        [Net.ServicePointManager]::SecurityProtocol = $oldProtocol -bor [Net.SecurityProtocolType]::Tls12
        if ([string]::IsNullOrWhiteSpace($Directory)) { throw 'No Desktop folder was found. Run win.ps1 with -DestinationDirectory and an existing folder.' }
        $destination = [IO.Path]::GetFullPath($Directory)
        if (-not [IO.Directory]::Exists($destination)) { throw "The download folder does not exist: $destination" }
        Write-Host 'TaC9: checking the signed release information...'
        $response = Get-TaC9FreshManifest -Uri $manifestUrl
        $json = $response.Content
        if ($json -is [byte[]]) { $json = [Text.Encoding]::UTF8.GetString($json) }
        # PowerShell 7.5+ otherwise converts the signed ISO timestamp into a DateTime.
        if ((Get-Command ConvertFrom-Json).Parameters.ContainsKey('DateKind')) {
            $manifest = $json | ConvertFrom-Json -DateKind String
        } else {
            $manifest = $json | ConvertFrom-Json
        }
        Assert-TaC9SignedManifest -Manifest $manifest -PublicKeyXml $publicKey
        $releaseVersion = [version]::Parse([string]$manifest.version)
        $packageUrl = [uri]([string]$manifest.package_url)

        # The stable V2 asset/feed also serves V3 for existing clients. Save V3 under its own Desktop name.
        if ($releaseVersion.Major -ge 13) { $assetName = 'TaC9-PC-Optimization-Suite-V3.exe' }
        $target = Join-Path $destination $assetName
        $expected = ([string]$manifest.sha256).ToUpperInvariant()
        if ([IO.File]::Exists($target) -and (Get-TaC9FileSha256 -Path $target) -eq $expected) {
            Write-Host "The verified current release is already downloaded: $target"
        } else {
            $temporary = Join-Path $destination ('.' + $assetName + '.' + [guid]::NewGuid().ToString('N') + '.download')
            Write-Host ("TaC9: downloading version {0}..." -f $manifest.version)
            Invoke-WebRequest -Uri $packageUrl.AbsoluteUri -OutFile $temporary -UseBasicParsing -TimeoutSec 900 -MaximumRedirection 5
            if ((Get-TaC9FileSha256 -Path $temporary) -ne $expected) {
                throw 'Download checksum mismatch. The new file was refused; any existing download is unchanged.'
            }
            # Same-folder replacement keeps a previous download intact until validation succeeds.
            if ([IO.File]::Exists($target)) { [IO.File]::Replace($temporary, $target, [NullString]::Value) }
            else { [IO.File]::Move($temporary, $target) }
            $temporary = $null
            Write-Host "Download verified: $target"
        }
        Write-Host 'Open the EXE when ready. No app was launched or security setting changed.'
        Write-Host 'License key: join https://discord.gg/3nrUffpVzt and open a support ticket.'
        Write-Host 'Socials and COD Config Installer do not require a license key.'
        Write-Host 'The app is not Windows Authenticode-signed; its internal release signature is separate.'
    } finally {
        if ($temporary -and [IO.File]::Exists($temporary)) { [IO.File]::Delete($temporary) }
        [Net.ServicePointManager]::SecurityProtocol = $oldProtocol
    }
} $DestinationDirectory
