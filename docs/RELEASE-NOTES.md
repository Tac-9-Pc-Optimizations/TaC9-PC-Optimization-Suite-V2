# Release Notes

## 12.2.13 - September 6, 2026

[Download the release](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/tag/v12.2.13).

### Updates on Every Launch

- Removed the four-hour startup update cache. Every normal launch now requests fresh suite and supported tool update information.
- The signed suite release continues to update all eight built-in workspaces as one package. Independent tool checks cover DDU, NVCleanstall, ISLC, and the approved compatible NVIDIA Profile Inspector release.
- Missing, invalid, or unreachable suite metadata no longer prevents the supported tool checks from being attempted.
- Incomplete checks no longer report that everything is current. The suite opens with verified local copies and tries again on the next launch.
- Preserved signed-manifest, checksum, internal-package verification, and the existing update helper's restart and rollback behavior.
- Preserved signed timestamp text when the update functions are tested under newer PowerShell versions.
- Existing workspace layouts, artwork, license behavior, and maintenance action controls are unchanged. X3D Core Tester, CoreCycler, and y-cruncher remain excluded.

### Installing This Update

In 12.2.12, select **Check for Updates** once to bypass that version's four-hour startup cache. Alternatively, close the suite and run the short PowerShell command on the repository home page. The old version remains available as its own release.

Startup checks do not perform driver cleanup, Windows repair, app removal, or COD configuration. Tool updates follow the suite's supported sources and compatibility choices, not arbitrary third-party versions.

### Verification

- Passed 16 startup-update regression cases in Windows PowerShell 5.1 and PowerShell 7, including repeat launches, unavailable sources, missing tool updater, invalid manifests, checksum failures, package rejection, and verified installer handoff.
- The regression harness used the real published manifest and packaged public-key verifier; update downloads and process launches were mocked to avoid changing the test PC.
- Full build, COD regression harness, package verification, extraction verification, and UI startup smoke passed.
- Package-integrity and launcher-portability checks passed, including tampering rejection.

### Download Integrity

- File: `TaC9-PC-Optimization-Suite-V2.exe`
- Size: 170,794,992 bytes (approximately 163 MiB)
- SHA-256: `F5461396258409DD7A87F8DF9DE8F316141CB928F23B5BB20313FBD0BE597D22`
- The internal package and updater manifest are signed; the executable is not Windows Authenticode-signed.

## 12.2.12 - September 6, 2026

[Download the release](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/tag/v12.2.12).

### Included

- Eight workspaces: Optimization Suite, Windows Repair, GPU Studio, COD Config Installer, Debloat Tool, ISLC Setup, PC Health Center, and TaC9 Socials.
- The existing TaC9 blue-and-yellow interface, branded headings, and shared controls.
- Integrated COD configuration inside the full suite.

### Changed

- Removed the X3D Core Tester page, navigation entry, native action routes, worker launch path, and packaged tester payload.
- Excluded CoreCycler, y-cruncher, tester artwork, and tester-specific entry-point executables from the new package.
- Preserved the ordinary hardware-monitoring components used by PC Health Center.
- Renumbered the eight remaining navigation items.
- Added customer-facing descriptions and one screenshot for each remaining workspace.
- Configured the separate V2 update channel for this repository without changing the legacy suite channel.
- Updated the suite's Discord link to match the license-ticket instructions.
- Included additional third-party notices and the complete original signed ISLC distribution.

### Verification

- Packaged UI checks passed for all eight pages at 2560x1440, 1920x1080, 1366x768, 1024x768, and 800x600, with no horizontal page overflow or broken active images detected.
- Browser checks reported no page-script errors; the tested 3D emblem was nonblank and animated.
- Package-integrity tests accepted the signed internal manifest and rejected direct extracted launch, UI tampering, and manifest rewriting.
- Launcher portability checks passed with renamed/copied and read-only source files; damaged and rebranded package copies were rejected.
- COD regression checks passed 118 cases during the build.

These checks do not replace real-hardware maintenance testing. No driver cleanup, app uninstall, or Windows repair was performed to capture these screenshots. The screenshot environment uses example hardware and status data.

### Download Integrity

- File: `TaC9-PC-Optimization-Suite-V2.exe`
- Size: 170,959,088 bytes (approximately 163 MiB)
- SHA-256: `DB4C71701F6A6E9B01EAAD631E5B693E913E910BBB30B54822BCBB2090E36568`
- The internal package and updater manifest are signed; the executable is not Windows Authenticode-signed.

Get a license key by [joining the TaC9 Discord](https://discord.gg/3nrUffpVzt) and opening a support ticket. Socials and COD Config Installer remain key-free.
