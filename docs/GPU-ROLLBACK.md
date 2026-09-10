# GPU installation and rollback

GPU Studio offers **Auto Install**, **Choose Driver**, and **Roll Back Driver**. All three use the Suite's clean NVIDIA installation process. Roll Back Driver selects the version saved before your last normal Suite installation.

![GPU Studio](screenshots/gpu.png)

## Install or update a driver

1. Save your work, close games, and open **GPU Studio** with administrator access.
2. Select **Auto Install** for the newest compatible WHQL Game Ready driver available to the workflow, or **Choose Driver** to select a supported version.
3. Let the Suite save and verify the installed NVIDIA driver version and GPU identity. It stops before cleanup if this record cannot be saved.
4. The Suite prepares and checks the clean driver package with NVCleanstall, runs DDU, installs the prepared package, initializes NVIDIA Control Panel in the background, and applies the supplied TaC9 profile and display settings.
5. Let the installation finish, then restart Windows normally when convenient. Driver and profile checks run during installation.

The screen can flicker or briefly go black during driver removal and installation. Keep the Suite open while it is working. Do not start a second driver installer at the same time.

## Return to the previous driver

1. Open **GPU Studio** and select **Roll Back Driver**.
2. Review the saved previous version and confirm the operation.
3. The Suite verifies the saved driver record and matching GPU, then prepares that previous version with NVCleanstall before starting DDU.
4. DDU removes the current driver. The Suite installs the prepared previous driver and applies its normal profile and display settings.
5. Let the installation finish, then restart Windows normally when convenient.

Rollback uses the version recorded in the backup, not whichever driver is newest at the time. If the backup, GPU identity, or required driver package cannot be verified, the Suite stops before cleanup.

## One previous driver at a time

The Suite keeps one small record containing the previous NVIDIA driver version, GPU identity, and Windows ownership information. It does not copy driver files, NVIDIA applications, old profiles, or monitor settings for this record. The matching driver package is prepared when rollback is requested, so internet access and an available supported package are required.

A new normal install saves the currently installed version, verifies the new record, and then deletes the old managed backup. A failed save keeps the previous record. Rollback preserves it. Older full backups are retired when a new normal install successfully saves its replacement.

For example, installing B while A is installed saves A. Roll Back then selects A. Starting a later normal install while B is installed replaces the record with B. Only one previous version is retained.

Saving the version is a small local step. Downloading and preparing the selected package, running DDU, and installing it take longer. Progress reports each stage separately.

## Close and reopen progress

Select **Close** to hide the GPU progress window while work continues, then **Show GPU progress** to bring it back. Closing the progress window does not cancel DDU or driver installation. Keep the Suite itself open until the operation finishes.

## What rollback restores

It reinstalls the saved previous NVIDIA driver through the normal clean installation process, then applies the Suite's settings. It does not promise an exact copy of every old NVIDIA app or custom setting, and it does not rewind Windows, games, or unrelated files.

The automated workflow supports compatible NVIDIA driver packages. Hardware, component, or package combinations that cannot pass the driver-record and package preparation checks stop before DDU. A driver record belongs to the PC and Windows user that created it. Protected tools require a paid key; contact the [TaC9 Discord](https://discord.gg/3nrUffpVzt) through a support ticket for access.

## If the process stops

GPU installation no longer saves a resumable install checkpoint or requires a Continue step after restarting. Each installation runs from start to finish in the current session. Old saved installation status cannot block a new run.

Read the stage and error shown in GPU Studio. Finish or close any active DDU, NVCleanstall, or driver installer before starting another run. Auto Install and Choose Driver start a fresh installation; Roll Back Driver uses the saved previous version. The Suite still verifies the driver package, cleanup, installed driver, and profile, and stops if those required checks fail.

If optional packages such as **NVIDIA Video Effects, NVIDIA App, GeForce Experience, FrameView, or Broadcast** remain registered, the Suite records a note and continues installing the driver and applying its settings. It checks for these packages after DDU and after installation. A remaining registration does not mean the driver or display settings failed, and the Suite does not claim that package was removed.

The screenshot shows the packaged interface in a UI smoke run; it does not exercise DDU or driver installation.

## NVIDIA color settings and scaling override

The Suite keeps the current resolution and selects a supported refresh rate at that resolution, trying a lower rate if the first choice is rejected. Duplicated Windows displays share one refresh-rate change, while each NVIDIA display target receives its own color settings.

Output color requests RGB, Full dynamic range, and NVIDIA/user color settings. It tries 10-bit color, then 8-bit when needed. The Suite distinguishes a setting accepted by the driver from one also confirmed by read-back. If the driver accepts the setting but cannot report it back, the setting stays applied without being marked as verified. Rejected settings produce a warning.

The scaling override is saved and checked in the NVIDIA display database. Restart Windows to load that persisted setting. The save check alone does not prove the current Control Panel checkbox state.

If display settings need attention, a successful driver installation finishes at 100% with **Setup notes**. The notes identify which settings need review. Optional-package notes are shown separately from the display-setting status. Driver, package, and profile failures still stop the workflow.

An old unfinished-install message does not require clearing a checkpoint. Update the Suite, close any driver tools still running, then choose the installation you want to run.

## Background profile setup

GPU setup initializes NVIDIA Control Panel in the background, then opens Profile Inspector in the background to apply the saved profile and closes both tools. The old Control Panel preview-page automation is removed. You can still use the separate Control Panel and Profile Inspector buttons to open either tool manually.

For **Black Ops 7**, the Suite saves ReBAR as enabled and then saves it as disabled, matching the reapply sequence used for that game's profile. It reads back the final Black Ops 7 setting as Disabled. This refresh leaves global ReBAR unchanged. Keep the game closed during profile setup, then launch it after the installation and any requested restart.
