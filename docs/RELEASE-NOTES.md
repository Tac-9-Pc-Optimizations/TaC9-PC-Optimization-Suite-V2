# Release Notes

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
