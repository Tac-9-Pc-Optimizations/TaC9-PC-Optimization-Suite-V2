# TaC9 PC Optimization Suite V2

**Windows optimization, repair, NVIDIA driver setup, game configuration, and PC health in one desktop suite.**

TaC9 brings the everyday work of setting up and maintaining a gaming PC into one coordinated Windows interface. Review system information, choose Windows settings, perform a clean NVIDIA driver setup, install the TaC9 Call of Duty configuration, remove unwanted apps, configure ISLC, and investigate hardware or Windows reliability issues without searching through separate tool folders.

The suite is distributed as a **free app**. This repository is for customer downloads, documentation, screenshots, and release notes. It does not publish the protected application source or customer access data.

[Download](#download) | [Included Apps](#included-apps) | [Getting Started](#getting-started) | [Support](#support) | [Release Notes](docs/RELEASE-NOTES.md)

![TaC9 Optimization Suite dashboard and eight-app navigation](docs/screenshots/suite.png)

> Screenshots show the packaged 12.2.12 interface with example hardware and status data. They demonstrate the layout, not completed maintenance operations or performance results. Actual readings and available controls depend on your PC.

## Download

**Current release: 12.2.12**

**[Download the full TaC9 suite for Windows](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/latest/download/TaC9-PC-Optimization-Suite-V2.exe)**

[All releases and release notes](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases) | [SHA-256 checksum](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/latest/download/SHA256SUMS.txt)

One complete Windows executable, `TaC9-PC-Optimization-Suite-V2.exe`, includes the suite's eight workspaces. The COD Config Installer is included inside the suite, not offered here as a separate executable. Version 12.2.12 is approximately 163 MiB.

The X3D Core Tester, CoreCycler, and y-cruncher are not included in this release.

### PowerShell Download

This downloads **version 12.2.12 to your Desktop** and checks its SHA-256 before reporting success. It does not execute a remote script, launch the app, change execution policy, or disable Windows security protections.

```powershell
$url = 'https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/download/v12.2.12/TaC9-PC-Optimization-Suite-V2.exe'
$file = Join-Path ([Environment]::GetFolderPath('Desktop')) 'TaC9-PC-Optimization-Suite-V2.exe'
Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing
if ((Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash -ne 'DB4C71701F6A6E9B01EAAD631E5B693E913E910BBB30B54822BCBB2090E36568') { throw 'Download checksum mismatch. Do not run this file.' }
Write-Host "Download verified: $file"
```

Open the downloaded executable when you are ready, then follow [Getting Started](#getting-started) to obtain and save your license key. Administrator permission is required for system-changing actions; downloading the file alone does not require elevation.

## Included Apps

| Workspace | What it does |
| --- | --- |
| [Optimization Suite](#optimization-suite) | System overview, Windows optimization controls, personal settings, service profiles, and selected advanced settings. |
| [Windows Repair](#windows-repair) | Combined DISM + SFC repair, individual repair modes, live progress, and saved results. |
| [GPU Studio](#gpu-studio) | One-click NVIDIA driver cleanup, debloat, newest compatible driver installation, and TaC9 profile setup. |
| [COD Config Installer](#cod-config-installer) | Game- and platform-specific configuration installation, original-file backups, and guarded shader-cache cleanup. |
| [Debloat Tool](#debloat-tool) | Application discovery, reviewed uninstall selections, and constrained app-owned leftover cleanup. |
| [ISLC Setup](#islc-setup) | ISLC installation, detected-memory presets, startup configuration, and monitoring setup. |
| [PC Health Center](#pc-health-center) | Supported live sensors, storage and memory information, Windows reliability evidence, and report export. |
| [TaC9 Socials](#tac9-socials) | Official community, support, and video channels. |

### Optimization Suite

**A central command center for understanding your PC and choosing the Windows changes you actually need.**

The opening dashboard brings processor, graphics, motherboard, memory, BIOS, and operating-system details together with the suite's Windows tools. It provides access to personal settings, optimization cards, service profiles, selected registry controls, repair utilities, and optional changes that require extra care.

- **TaC9 Personal Settings:** apply the supplied settings profile, review the operation, and use its available restore workflow.
- **Windows Optimization Cards:** grouped controls for gaming, privacy and telemetry, power, networking, storage, input, graphics, and Windows behavior, with live state and restore controls where supported.
- **Services Profile:** inspect startup and running state, choose individual services, and apply supported Enable, Manual, Disable, or profile actions.
- **Advanced Registry:** explicit controls for the supported advanced settings rather than unrestricted registry editing.
- **Repair and runtime tools:** access the included Windows repair, reset, and runtime-maintenance workflows.
- **System scan:** shows how much of the expected inventory was detected. A 100% scan means complete inventory, not a benchmark score or a guarantee of perfect hardware.

Optional or caution-marked settings should be reviewed individually. More disabled services or more changes do not automatically mean better performance.

### Windows Repair

**A guided Windows image and system-file repair workspace with the real operation kept visible.**

Choose **DISM + SFC Full Repair** to repair the Windows component image first, then check protected system files. Individual **DISM RestoreHealth** and **SFC Scannow** modes are also available when you only need one part of the workflow.

- Runs DISM before SFC in the combined repair mode and waits for the processes to finish.
- Displays repair progress, elapsed time, session status, and an activity log inside the suite.
- Reports whether Windows found corruption, repaired it, encountered an error, or still needs attention.
- Saves a session log for troubleshooting and keeps the restart decision explicit.

Keep the app open during a repair. Some DISM failures require a matching Windows repair source or further investigation; a repair tool cannot resolve every hardware or Windows problem.

![Windows Repair with repair-mode selection, operation progress, session details, and repair policy](docs/screenshots/repair.png)

### GPU Studio

**A full one-click NVIDIA driver uninstall, debloat, update, and profile-setup workflow.**

GPU Studio coordinates the clean driver process from one place: detect the NVIDIA GPU, prepare the **newest compatible WHQL Game Ready driver available to the workflow**, clean the existing NVIDIA driver installation with DDU, install the prepared clean driver package, validate NVIDIA Control Panel, and apply the supplied TaC9 NVIDIA settings through NVIDIA Profile Inspector.

The **One-click Automatic GPU Debloat** action handles the main sequence:

1. Check the detected NVIDIA hardware and required utilities, then select and validate the compatible driver package before cleanup.
2. Prepare the clean installation and run the automated DDU cleanup stage.
3. Install the prepared driver and check the resulting driver state.
4. Initialize and validate NVIDIA Control Panel, then apply the supplied TaC9 profile settings through NVIDIA Profile Inspector.
5. Verify the profile through NVAPI and report the individual workflow stages in the operation results.

You can also **apply the NVIDIA Profile Inspector profile without reinstalling the driver**, open NVIDIA Control Panel, or open Profile Inspector for inspection. The profile-only action backs up the current profile before applying the supplied configuration.

The TaC9 profile covers its included NVIDIA settings; it is not a promise that every possible Control Panel option will be changed. Driver selection depends on hardware compatibility, upstream availability, and successful validation. The driver/profile version visible in a screenshot is an example, not a permanent claim about the newest version.

**NVIDIA only.** Save your work and close games before driver maintenance. The display may flicker or briefly go black, and a restart may be needed. Windows prompts and required third-party utility windows may still appear while the suite coordinates the operation.

![GPU Studio showing the one-click workflow, NVIDIA profile action, Control Panel, and per-stage results](docs/screenshots/gpu.png)

### COD Config Installer

**Install the supplied TaC9 Call of Duty player configuration with game-specific paths and original-file recovery.**

The installer provides separate **BOPS7** and **MW4 Beta** modes with **Battle.net** and **Xbox App** platform selection. It checks the selected installation, shows the player-configuration state, preserves the original matching files, and applies only the configuration intended for that mode.

- Detects and validates the selected game and platform paths before making changes.
- Preserves first-seen originals so installing again does not replace the original backup with an already-modified configuration.
- Supports **Restore Original** for the files managed by the installer.
- Limits shader-cache cleanup to recognized files in the validated selected installation.
- Leaves unrelated player files alone and refuses paths that do not match the selected mode.

Close the game before installing or restoring its configuration. Clearing shader cache may cause shaders to rebuild on the next launch. The tool manages configuration and cache files; it does not provide an anti-cheat bypass, unlock paid content, or modify the game executable. Game updates can change file formats and supported paths.

This workspace is available inside the suite without a TaC9 access key.

![COD Config Installer showing game and platform selection, validated locations, backup, restore, and installation controls](docs/screenshots/installer.png)

### Debloat Tool

**Find unwanted apps, review the selection, and remove them with clear cleanup boundaries.**

The Debloat Tool brings installed-application discovery, recommended selections, **Select All Safe**, additional app scanning, and **Remove Selected Apps** into one workspace. You stay in control of what is selected before the uninstall action runs.

After the ordinary uninstallers finish, TaC9 can scan for high-confidence app-owned leftover files, folders, and shortcuts. Shared or uncertain items are not treated as safe just because their names resemble an app, and selected leftovers are checked again before removal.

- Reviews multiple selected apps together and combines duplicate leftover matches.
- Protects Windows locations, drivers, shared runtimes, Microsoft package data, and TaC9 runtime files from leftover deletion.
- Does not use leftover cleanup to delete registry entries, services, or scheduled tasks.
- Warns about protected applications and explains the potential compatibility impact.
- Presents an explicit Xbox-component choice during the uninstall workflow.

Uninstalling an app can remove local settings or affect software that depends on it. Review every selection, especially launchers, shared services, and applications you use for work.

![Debloat Tool with application search, selection actions, and cleanup protection information](docs/screenshots/debloat.png)

### ISLC Setup

**Set up Intelligent Standby List Cleaner with the detected memory profile and manageable startup behavior.**

ISLC Setup handles the included ISLC workflow from installation and fresh opening through RAM-specific configuration and monitoring setup. **Auto Detect Config** selects the supported preset for the detected memory amount, while explicit **16 GB**, **32 GB**, and **64 GB** options remain available.

- **Fresh Open ISLC:** reset the previous ISLC state, apply the detected profile, start monitoring, verify the state, and minimize the utility.
- **Auto Detect Config:** apply the supported detected-memory preset and startup settings.
- **RAM presets:** show the list-size and free-memory thresholds used by each included configuration.
- **Open ISLC:** bring its existing window to the foreground, including a previously minimized window.
- **Revert / Disable Startup:** stop monitoring and remove obsolete duplicate TaC9 startup entries.
- **Open Guide Folder:** access the supplied setup and recovery references.

Memory cleanup is workload-dependent and is not a substitute for enough physical RAM. The suite does not promise that an ISLC preset will improve every game or PC.

![ISLC Setup with detected RAM, automatic configuration, presets, and startup protection](docs/screenshots/islc.png)

### PC Health Center

**An evidence-based view of supported hardware readings and Windows reliability history.**

PC Health Center groups **Overview**, **Thermals**, **Storage**, **Memory**, and **Reliability** into one monitoring workspace. It combines the sources available on the current PC, including Windows inventory, supported sensor providers, storage status, and event-log evidence.

- Review processor and graphics temperatures, available power or clock readings, memory use, and storage information.
- Inspect component findings and their supporting evidence instead of relying on one unexplained score.
- Review recorded WHEA hardware errors, display resets, application faults, and unexpected shutdowns where available.
- Adjust the sensor refresh interval, pause monitoring, run a health scan, and export a report.
- Distinguish reported healthy state, review items, critical findings, and unavailable data.

Unsupported sensor channels stay unavailable rather than being invented. A healthy result means no fault was found in the supported sources and selected evidence window; it is not a stress test, a hardware certification, or a guarantee against future failure.

![PC Health Center with component evidence, findings, sensor controls, and a live trend view](docs/screenshots/health.png)

### TaC9 Socials

**The suite's direct route to the TaC9 community, help, and videos.**

Open the official Discord for support and announcements, visit the TaC9 YouTube and TikTok channels for published content, or follow the links to X, Facebook, and the TaC9 GitHub profile. Links open through their configured app or browser destination and do not apply PC settings. This workspace does not require a TaC9 access key.

![TaC9 Socials with official community and video-channel links](docs/screenshots/socials.png)

## Getting Started

1. [Download the full-suite executable](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/latest/download/TaC9-PC-Optimization-Suite-V2.exe), or use the [PowerShell download](#powershell-download) above. Compare its SHA-256 checksum with the release information.
2. **[Join the official TaC9 Discord](https://discord.gg/3nrUffpVzt) and open a support ticket to request your license key.** The TaC9 team will help you obtain the key for the protected tools.
3. Save your work. Back up important files and create a Windows restore point before making substantial system changes.
4. Launch the suite with administrator rights when required for system operations. The interface uses Microsoft Edge WebView2; the launcher can attempt runtime setup when it is missing.
5. Open **License**, enter the key provided through your Discord ticket, and select **Save & unlock**. Keep your key private; do not post it in a public channel or GitHub issue.
6. Review the detected hardware, choose a workspace, read the operation details, and confirm the intended settings. Keep the suite open until the final result is displayed.

**No key is needed for the Socials tab or its official links.** You can use Socials to reach Discord before activating the protected tools. The COD Config Installer also does not require a license key. If the license dialog appears when the full suite starts, close it to use these key-free workspaces.

### Requirements and Compatibility

- A 64-bit Windows PC. Windows 11 is the primary interface target; individual operations depend on the installed Windows build and available components.
- Administrator access for driver, Windows repair, service, and other system-level operations.
- Internet access for driver or tool downloads, update checks, and online services when used.
- Microsoft WebView2 for the desktop interface.
- A supported NVIDIA GPU for GPU Studio's automated driver workflow.
- A matching installed game and platform for the COD configuration workflow.

The interface has been checked at 800x600, 1024x768, 1366x768, 1920x1080, and 2560x1440. Smaller windows use scrolling where needed. This is layout testing, not certification of every monitor, DPI setting, Windows build, or hardware combination.

### Verify a Download

Open PowerShell in the download folder and run:

```powershell
Get-FileHash -LiteralPath '.\TaC9-PC-Optimization-Suite-V2.exe' -Algorithm SHA256
```

Compare the full value with the checksum supplied for that exact release. A checksum helps detect a mismatched or damaged download; it does not replace publisher verification or a security scan.

This release is **not Authenticode-signed**. TaC9's internal package-integrity checks are separate from a trusted Windows publisher signature. Do not disable Windows security protections to run an unexpected or unverified file.

## Backups, Results, and Limits

TaC9 keeps operation logs and uses the backup, checkpoint, or restore behavior supported by each workflow. COD original-file backups, NVIDIA profile backups, and supported Windows-setting restore actions are not a full-system backup and cannot reverse every possible change.

No fixed FPS increase, latency reduction, stability result, or successful repair is guaranteed. Choose changes for your actual hardware and workload. Keep games closed during configuration changes, do not interrupt driver installation or Windows repair, and review any requested restart.

Third-party utilities and libraries retain their own authorship and terms. The suite coordinates them; it does not claim ownership of Microsoft, NVIDIA, DDU, ISLC, or other third-party software. TaC9 is not affiliated with or endorsed by Microsoft, NVIDIA, or Activision. See [Third-Party Software](docs/THIRD-PARTY.md) and the notices supplied with the relevant components.

## Support

Join the [official TaC9 Discord](https://discord.gg/3nrUffpVzt) and open a support ticket to get your license key, ask an access question, or get help interpreting an operation result. You can also find TaC9 on [YouTube](https://youtube.com/@tac9-fps) and [TikTok](https://www.tiktok.com/@tac._.9).

Include the suite version, Windows build, selected app and action, the exact error, and steps to reproduce it. Before sharing screenshots or logs, remove access keys, HWIDs, account details, personal paths, and other private data. Never post a license file or private key in a public issue.

For security-sensitive reports, see [Security and Privacy](SECURITY.md).
