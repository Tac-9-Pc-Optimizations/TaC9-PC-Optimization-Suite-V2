# Release Notes

## V3 13.0.0 - September 7, 2026

[Download V3](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/tag/v13.0.0). Build **01589DA9**.

### Visuals and Readability

- Full-screen startup with the rotating TaC9 emblem, assembling silver chassis, improved blue/gold lighting, and a smoother outward transition into the suite.
- Startup progress remains visible until the outward transition starts. The native window waits for its first composed frame before becoming visible.
- Larger, clearer text, hover-driven trim animation, and content-aware scrolling. Active progress trims continue while verification is pending.
- Corrected dashboard/sidebar clipping at 1080p and common scaled sizes; the health trend reserves space for its full time axis.

### Expanded PC Health Center

- Current, Min, Max, Average, Source, and State across supported sensor tables.
- Device filters for CPU, GPU, RAM, motherboard, and storage, combined with reading-type filters.
- Temperature, voltage, wattage, clock/effective-clock, utilization, fan/duty, electrical-current, transfer-rate, RAM-activity, and GPU-memory sections where exposed.
- Measured motherboard CPU Vcore appears in the CPU group when available. Requested VID and memory-controller voltages retain their distinct labels.
- Shared sensor acquisition prevents an older health snapshot from erasing a newer GPU hotspot reading.
- CPU-support diagnostics distinguish missing driver, elevation, blocked access, limited coverage, and restart-required states. Optional **Set Up CPU Sensors** uses the original signed PawnIO 2.2.0 installer only after confirmation; reopen TaC9 afterward.
- Missing readings remain unavailable, never estimated. Sensor support varies by hardware, firmware, and provider. No promise of every sensor on every CPU or RAM module.

### GPU Error and Operation Status

- Fixed the process-inventory variable collision that reproduced `Cannot find an overload for "Add" and the argument count: "1"` with GPU-Z and regex-matched HWiNFO process names.
- Fixed the retained GPU workflow's status-callback parameter compatibility.
- Failed operations preserve their last percentage, mark untouched stages **Not run**, and remove the active restart warning. Only accepted successful completion reaches 100%.
- Added local GPU error diagnostics for troubleshooting without publishing customer logs.

### Installing and Updating

The repository URL and short PowerShell command are unchanged. The current downloader saves `TaC9-PC-Optimization-Suite-V3.exe` on the Desktop; it does not remove differently named suites, settings, keys, or backups.

Existing V2 clients use the same signed `manifest-v2.json` feed to discover V3. The V2-named asset in this release contains the **identical V3 executable** for old download links and updater compatibility. An in-app upgrade keeps the installed file's name/location. Previous genuine V2 builds remain available in their original releases.

Earlier local V3 test builds also used version 13.0.0. Use the current downloader to replace those with build **01589DA9**; the version-based updater does not regard the same version as newer.

[Join Discord](https://discord.gg/3nrUffpVzt) and open a support ticket for your license key. Socials and COD Config Installer remain key-free. The app remains free, and X3D Core Tester, CoreCycler, and y-cruncher remain excluded.

### Verification and Limits

- Package integrity, authenticated extraction, and private-data/secret checks passed before publication.
- All eight native screens, live sensors, startup/progress visibility, and layout checks passed. Native window sizes included 1920x1080, 1536x864, and 1280x720; browser layout checks also included 1366x768.
- Eight simulated GPU-process cases passed in Windows PowerShell 5.1 and the compiled PowerShell host. Driver-package and companion-inventory fixture tests passed.
- The exact reported GPU-script failure was reproduced and corrected. Tests did not perform a real DDU cleanup, driver installation, app removal, or Windows repair. Full maintenance results still require validation on the target PC.

### Download Integrity

- Preferred file: `TaC9-PC-Optimization-Suite-V3.exe`
- Compatibility filename: `TaC9-PC-Optimization-Suite-V2.exe` (identical V3 bytes)
- Size: 200,761,248 bytes (approximately 191.5 MiB)
- SHA-256 for either executable: `41DDD93EE56B56B78C925F40E9A5796AB9429E2F61A9595E99693257D557F652`
- Signed update manifest and internal package integrity; **not Windows Authenticode-signed**. Do not disable Windows security protections.

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
