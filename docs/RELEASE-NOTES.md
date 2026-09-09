# Release Notes

## V3 13.0.9 - September 9, 2026

**Clearer DISM and SFC repair results.**

- SFC now reads Windows output correctly when it contains Unicode padding or line breaks, so repaired files and clean scans are recognized in the live result.
- The final summary uses the current run's verdict. An older log cannot turn an unreadable result into “no repairs needed.”
- DISM runs ScanHealth before RestoreHealth to establish whether corruption was present. This adds scan time and allows a clean scan to be distinguished from a completed repair.
- Corruption that remains, failed scans, and unverified results finish with a warning. A successful process exit alone is not treated as proof that no repair was needed.

The combined repair still runs DISM and SFC automatically from one selection. Protected tools require a paid key.

Update with **Check for Updates** or download the latest V3 executable.

SHA-256 for either executable:

```
9F26E2F950E964519A3E880E261454C1459096BCF210DE1A5411A3C93B8D07CD
```

## V3 13.0.8 - September 8, 2026

**Removed the automatic NVIDIA Control Panel preview step.**

GPU setup no longer launches NVIDIA Control Panel to change its legacy image-preview option. That automation and its preview-status fields have been removed completely.

Driver installation, the NVIDIA profile, OpenGL GPU selection, output-color checks, and scaling-override persistence remain included. The separate NVIDIA Control Panel button still opens it when selected manually.

The checkpoint and display fixes from 13.0.7 are included. Restart and use Continue when prompted. Protected tools require a paid key.

Update with **Check for Updates** or download the latest V3 executable.

SHA-256 for either executable:

```
C6FCF0FE8380F1970D425EC5ECBB32BA71DA8E5A87DAF33D0C8DE3129A13603E
```

## V3 13.0.7 - September 8, 2026

**GPU checkpoint, display-target, and color-verification fixes.**

- A completed driver installation no longer requires a full monitor-recovery snapshot. A mismatch between NVIDIA display targets and Windows monitor identities could previously stop this final step after the driver and Suite settings were installed.
- Continue can now save a missing final checkpoint without repeating an already-completed driver installation. It still requires the saved installation results to confirm that the driver, Control Panel, profile, and display-setting steps finished.
- Restart verification checks the installed driver and NVIDIA profiles. Display settings are applied during installation; this check does not claim to reverify every monitor setting after restart.
- Duplicated displays now include each NVIDIA output target when applying color settings, rather than assuming one target per Windows display name.
- Output-color setup tries supported 10-bit RGB/full-range output, falls back to 8-bit when needed, and reads back the format, range, bit depth, and NVIDIA/user selection policy. A successful request with the default policy still active is no longer reported as applied.
- Scaling override is saved and read back after the other display changes, so later mode/color calls cannot overwrite that save. Restart Windows to load the persisted setting. Registry verification does not by itself prove the current Control Panel checkbox state.
- Unverified color settings or scaling-override saves leave the display step incomplete. Continue can retry it without repeating completed driver steps.
- The small previous-driver record and working GPU progress Close / Show GPU progress controls from 13.0.6 remain included.

If an installation stopped at the final monitor-identity checkpoint, update the Suite and use **Continue**. Follow its restart prompt, then use Continue again for the driver/profile checks. If Continue is unavailable, keep the saved checkpoint and contact support rather than starting another cleanup.

Automated tests cover duplicated-target mapping, color read-back failures, and checkpoint continuation. The current fix has not been visually verified on every monitor/capture-card combination.

NVIDIA-only. Rollback requires internet access and a compatible available driver package. Protected tools require a paid key.

[GPU installation and rollback guide](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/blob/main/docs/GPU-ROLLBACK.md)

SHA-256 for either executable:

```
4A11726BEA66944ED294087241B3739E4B2315EEF30FDFEBD87D78664F0253A4
```

## V3 13.0.6 - September 8, 2026

**Faster previous-driver saving and a working Close button in GPU progress.**

- Auto Install and Choose Driver now save a small record of the installed NVIDIA driver version and GPU identity before cleanup. This step no longer exports driver files, downloads a recovery installer, or copies NVIDIA apps, profiles, and display settings.
- Only one previous driver record is kept. A replacement is verified before the old managed backup is deleted. Failed saves keep the previous record, and Continue or Roll Back never overwrite it.
- Roll Back Driver still prepares the saved previous version with NVCleanstall, verifies the package before DDU, and installs it with the Suite settings. If the driver record or package cannot be verified, cleanup stops.
- **Close** now hides the GPU progress window while the operation continues. Use **Show GPU progress** to bring it back. Keep the Suite itself open until the operation finishes.

The small record is a version reference, not an offline driver package. Rollback requires internet access and an available compatible NVIDIA driver package. Downloading, preparing, cleaning, and installing the driver still take time. The Suite continues checking the installed driver and its applied settings after installation and restart.

Protected tools require a paid key. Update through **Check for Updates** or download the latest executable. Both EXE names contain the same V3 build.

[GPU installation and rollback guide](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/blob/main/docs/GPU-ROLLBACK.md)

SHA-256 for either executable:

```
FFF23BCB9A63C9DFCA719FEDA518AFB16D5ABE50184C10AC49BC0E3BBD9A4ABD
```

## V3 13.0.5 - September 8, 2026

**Roll Back Driver is now available in GPU Studio.** If you want to return to the driver you had before your last Suite install, the Suite can prepare that version with NVCleanstall, remove the current driver with DDU, and install the previous one using the normal Auto Install process.

- **Automatic backup before installation.** Auto Install and Choose Driver save and verify the current GPU setup before cleanup starts. If the required backup cannot be completed, the Suite stops before DDU.
- **One saved backup.** A new normal install replaces the old backup only after the new one passes verification. A failed backup keeps the previous one. Rollback and Continue keep the existing backup.
- **Previous version checked before cleanup.** The saved driver version and detected GPU must match a compatible package. An unavailable or invalid package stops the process before driver removal.
- **Suite settings after installation.** The workflow checks NVIDIA Control Panel, applies the supplied Profile Inspector profile and display settings, and verifies the result after a restart.
- **Better recovery from interruptions.** Continue can finish the last verification step, and rollback can be retried after a restart if an installation was interrupted. Active installers block a competing rollback.
- **Clearer restart checks.** NVIDIA's own default profile entries can return after a restart. Verification accepts those confirmed defaults while still rejecting missing or changed expected settings.

The driver workflow remains NVIDIA-only and requires administrator access, internet access for preparation, and a supported driver package. Rollback installs the previous driver with the Suite's settings; it does not restore every old custom setting, every NVIDIA app, or a Windows image. It keeps one previous setup, not a history of every driver version.

The existing Choose Driver control and Steam support for the BOPS7 configuration remain included. Paid keys are required for protected Suite tools.

[Read the GPU installation and rollback guide](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/blob/main/docs/GPU-ROLLBACK.md).

Use **Check for Updates**, reopen the Suite to run its startup update check, or download the latest V3 executable. Both EXE names in this release contain the same V3 build; the V2 filename keeps older update links working.

SHA-256 for either executable:

```
5EAD02C1C0B0CA1A4ACA396B49DCDB6DDD633B7883F05A3771A99500563AB345
```

## V3 13.0.1 - September 7, 2026

[Download V3 13.0.1](https://github.com/Tac-9-Pc-Optimizations/TaC9-PC-Optimization-Suite-V2/releases/tag/v13.0.1). Build **00DFEE29**.

### CPU Sensor Validation and Diagnostics

- Check whether the CPU provider's hardware-access module loaded, with read-only Ryzen register checks that preserve the actual success/failure result.
- Show affected readings as **Unavailable** when access fails instead of accepting zero-filled clock/power values or a derived 1.550 V VID as valid live data. A genuine zero remains valid when the underlying read succeeds.
- Keep invalid samples out of Current/Min/Max/Average statistics while retaining previously valid history and independent working sensors.
- Show a clear CPU access-failure notice and include CPU identification, provider version, module state, and read results in exported health diagnostics.
- Detect installed PawnIO support older than the bundled/tested 2.2.0 and offer the existing user-confirmed setup flow. Nothing installs automatically, and Windows security settings are not changed.

### Verification and Scope

The release passed 52 CPU validation assertions, including live checks on a Ryzen 9 9950X3D; browser tests for failure/recovery, statistics, export, and two viewport sizes; and the packaged native UI/sensor checks across all eight workspaces, including 1080p and scaled layouts. Download and startup-update regression tests passed with the signed 13.0.1 manifest in Windows PowerShell 5.1 and PowerShell 7, including legacy download compatibility. Maintenance actions and sensor installation were not executed by those tests.

Sensor availability depends on the processor, firmware, and monitoring provider. This release adds Ryzen register-read validation and checks Intel module availability; individual Intel register validation is not included. Use the optional CPU sensor setup when offered, then reopen the suite. Restart Windows only if requested, and keep Windows security protections enabled.

### Updating

Use **Check for Updates**, reopen a suite version with startup update checks, or run the existing PowerShell download command. The signed feed delivers 13.0.1.0 as newer than 13.0.0.0. Both release EXE names contain the same V3 build; the V2-named asset preserves older updater compatibility. Previous public releases remain unchanged. This release does not change the V3 visual design.

SHA-256 for either executable:

```text
2E7B938106A762D0E902C5E82AAA17246CEC86AFE956290DDB3F4F328C1AE25A
```

TaC9's internal release signature is separate from Windows Authenticode. This executable is not Authenticode-signed.

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
- Added local GPU error diagnostics for troubleshooting; logs remain private.

### Installing and Updating

The repository URL and short PowerShell command are unchanged. The current downloader saves `TaC9-PC-Optimization-Suite-V3.exe` on the Desktop; it does not remove differently named suites, settings, keys, or backups.

Existing V2 clients use the same signed `manifest-v2.json` feed to discover V3. The V2-named asset in this release contains the **identical V3 executable** for old download links and updater compatibility. An in-app upgrade keeps the installed file's name/location. Previous genuine V2 builds remain available in their original releases.

Earlier local V3 test builds also used version 13.0.0. Use the current downloader to replace those with build **01589DA9**; the version-based updater does not regard the same version as newer.

[Join Discord](https://discord.gg/3nrUffpVzt) and open a support ticket for your license key. Socials and COD Config Installer remain key-free. The app remains free, and X3D Core Tester, CoreCycler, and y-cruncher remain excluded.

### Verification and Limits

- Package integrity, authenticated extraction, and private-data/secret checks passed before publication.
- All eight native screens, live sensors, startup/progress visibility, and layout checks passed. Native window sizes included 1920x1080, 1536x864, and 1280x720; browser layout checks also included 1366x768.
- Eight simulated GPU-process cases passed in Windows PowerShell 5.1 and the compiled PowerShell host. Driver-package and companion-inventory fixture tests passed.
- The GPU-script failure was reproduced and corrected. Tests did not perform a real DDU cleanup, driver installation, app removal, or Windows repair. Maintenance results depend on the system and selected operation.

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
- Added app descriptions and one screenshot for each remaining workspace.
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
