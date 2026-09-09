# GPU installation and rollback

GPU Studio offers **Auto Install**, **Choose Driver**, and **Roll Back Driver**. All three use the Suite's clean NVIDIA installation process. Roll Back Driver selects the version saved before your last normal Suite installation.

![GPU Studio in V3 13.0.6](screenshots/gpu.png)

## Install or update a driver

1. Save your work, close games, and open **GPU Studio** with administrator access.
2. Select **Auto Install** for the newest compatible WHQL Game Ready driver available to the workflow, or **Choose Driver** to select a supported version.
3. Let the Suite save and verify the installed NVIDIA driver version and GPU identity. It stops before cleanup if this record cannot be saved.
4. The Suite prepares and checks the clean driver package with NVCleanstall, runs DDU, installs the prepared package, checks NVIDIA Control Panel, and applies the supplied TaC9 profile and display settings.
5. Follow the restart prompt. Reopen the Suite and use **Continue** when offered to verify the installed driver and profiles.

The screen can flicker or briefly go black during driver removal and installation. Keep the Suite open while it is working. Do not start a second driver installer at the same time.

## Return to the previous driver

1. Open **GPU Studio** and select **Roll Back Driver**.
2. Review the saved previous version and confirm the operation.
3. The Suite verifies the saved driver record and matching GPU, then prepares that previous version with NVCleanstall before starting DDU.
4. DDU removes the current driver. The Suite installs the prepared previous driver and applies its normal profile and display settings.
5. Restart when requested and use **Continue** to verify the installed driver and profiles.

Rollback uses the version recorded in the backup, not whichever driver is newest at the time. If the backup, GPU identity, or required driver package cannot be verified, the Suite stops before cleanup.

## One previous driver at a time

The Suite keeps one small record containing the previous NVIDIA driver version, GPU identity, and Windows ownership information. It does not copy driver files, NVIDIA applications, old profiles, or monitor settings for this record. The matching driver package is prepared when rollback is requested, so internet access and an available supported package are required.

A new normal install saves the currently installed version, verifies the new record, and then deletes the old managed backup. A failed save keeps the previous record. Rollback and Continue preserve it. Older full backups are retired when a new normal install successfully saves its replacement; an unfinished operation keeps its original checkpoint.

For example, installing B while A is installed saves A. Roll Back then selects A. Starting a later normal install while B is installed replaces the record with B. Only one previous version is retained.

Saving the version is a small local step. Downloading and preparing the selected package, running DDU, and installing it take longer. Progress reports each stage separately.

## Close and reopen progress

Select **Close** to hide the GPU progress window while work continues, then **Show GPU progress** to bring it back. Closing the progress window does not cancel DDU or driver installation. Keep the Suite itself open until the operation finishes.

## What rollback restores

It reinstalls the saved previous NVIDIA driver through the normal clean installation process, then applies the Suite's settings. It does not promise an exact copy of every old NVIDIA app or custom setting, and it does not rewind Windows, games, or unrelated files.

The automated workflow supports compatible NVIDIA driver packages. Hardware, component, or package combinations that cannot pass the driver-record and package preparation checks stop before DDU. A driver record belongs to the PC and Windows user that created it. Protected tools require a paid key; contact the [TaC9 Discord](https://discord.gg/3nrUffpVzt) through a support ticket for access.

## If the process stops

Version 13.0.7 fixes a final checkpoint failure reporting that an NVIDIA target has no monitor identity. If the installation steps already finished, update the Suite and use **Continue** to save its checkpoint without repeating installation. Follow the restart prompt, then use Continue again. The restart check verifies the driver and profiles; display settings are applied during installation and are not separately reverified after restart.

Read the stage and error shown in GPU Studio. Keep the saved backup. Use Continue when offered after the requested restart. An active DDU, NVCleanstall, or driver setup process must finish before another rollback can start. If it still cannot continue, share the Suite version and exact error in a support ticket, keeping keys and personal details out of screenshots.

The screenshot shows the packaged interface in a UI smoke run; maintenance actions were intercepted for that screenshot. Driver installation was tested separately.

## NVIDIA color settings and scaling override

The Suite applies output color to each NVIDIA target, including targets sharing a duplicated Windows display. It reads back RGB, Full dynamic range, the supported bit depth, and the NVIDIA/user color policy. A request that leaves the default policy active is not marked as applied.

The scaling override is saved last and checked in the NVIDIA display database. Restart Windows to load that persisted setting, then check **Override the scaling mode set by games and programs** in Control Panel. The save check alone does not prove the current checkbox state. If either setting cannot be verified or saved, the display step remains incomplete and Continue can retry it.
