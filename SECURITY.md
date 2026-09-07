# Security and Privacy

## Report a Problem Privately

Contact the maintainer through the [official TaC9 Discord](https://discord.gg/3nrUffpVzt) and request a private support conversation for a security-sensitive issue.

Do not publish access keys, license files, HWIDs, authorization material, private signing keys, or unredacted logs in GitHub issues. Describe the affected version, the action taken, expected behavior, and the observed result. Share only the minimum redacted evidence needed to reproduce the problem.

## Download Verification

Use the official release and compare the executable's SHA-256 value with the checksum for that release. Do not use reuploaded copies or disable security software to bypass an unexplained warning. A matching checksum establishes file consistency, not a security certification.

V3 13.0.0 has internal package-integrity checks and a signed update manifest but is not Windows Authenticode-signed. These are different mechanisms and should not be confused. The optional bundled PawnIO installer has its own upstream Authenticode signature; that signature does not sign or certify the TaC9 executable.

## Repository Scope

This repository provides official documentation and downloads, not application source. Application executables belong in Releases. Private data, machine reports, build environments, credentials, private keys, and runtime authorization files do not belong in Git history.

Maintenance actions can modify Windows settings, drivers, applications, or game configuration files. Back up important data, review the selected operation, and keep the suite open until the operation finishes. Available restore features do not replace a full-system backup.
