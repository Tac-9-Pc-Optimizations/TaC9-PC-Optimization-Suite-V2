# GPU installation and rollback

GPU Studio offers **Auto Install**, **Choose Driver**, and **Roll Back Driver**. All three use the Suite's clean NVIDIA installation process. Roll Back Driver selects the version saved before your last normal Suite installation.

![GPU Studio in V3 13.0.5](screenshots/gpu.png)

## Install or update a driver

1. Save your work, close games, and open **GPU Studio** with administrator access.
2. Select **Auto Install** for the newest compatible WHQL Game Ready driver available to the workflow, or **Choose Driver** to select a supported version.
3. Let the Suite capture and verify the current GPU backup. It stops before cleanup if the required backup cannot be completed.
4. The Suite prepares and checks the clean driver package with NVCleanstall, runs DDU, installs the prepared package, checks NVIDIA Control Panel, and applies the supplied TaC9 profile and display settings.
5. Follow the restart prompt. Reopen the Suite and use **Continue** when offered to complete verification.

The screen can flicker or briefly go black during driver removal and installation. Keep the Suite open while it is working. Do not start a second driver installer at the same time.

## Return to the previous driver

1. Open **GPU Studio** and select **Roll Back Driver**.
2. Review the saved previous version and confirm the operation.
3. The Suite verifies the saved backup and matching GPU, then prepares that previous version with NVCleanstall before starting DDU.
4. DDU removes the current driver. The Suite installs the prepared previous driver and applies its normal profile and display settings.
5. Restart when requested and use **Continue** to finish the checks.

Rollback uses the version recorded in the backup, not whichever driver is newest at the time. If the backup, GPU identity, or required driver package cannot be verified, the Suite stops before cleanup.

## One backup at a time

After a successful backup, the Suite keeps one managed GPU backup. During a new normal installation it temporarily creates a replacement, verifies it, and then deletes the old one. That temporary overlap protects the old backup if capture fails, and requires enough free space for both while capture is running.

For example, installing driver B while driver A is installed saves A. Roll Back Driver then installs A. If you later start a normal install while B is installed, the new backup saves B and replaces A after verification. Rollback and Continue do not overwrite the saved previous setup.

Backup time depends on the installed NVIDIA components, drive speed, and downloads needed to prepare recovery files. Wait for the actual verification result rather than a fixed time estimate.

## What rollback restores

It reinstalls the saved previous NVIDIA driver through the normal clean installation process, then applies the Suite's settings. It does not promise an exact copy of every old NVIDIA app or custom setting, and it does not rewind Windows, games, or unrelated files.

The automated workflow supports compatible NVIDIA driver packages. Hardware, component, or package combinations that cannot pass the backup and preparation checks stop before DDU. A backup belongs to the PC and Windows user that created it. Protected tools require a paid key; contact the [TaC9 Discord](https://discord.gg/3nrUffpVzt) through a support ticket for access.

## If the process stops

Read the stage and error shown in GPU Studio. Keep the saved backup. Use Continue when offered after the requested restart. An active DDU, NVCleanstall, or driver setup process must finish before another rollback can start. If it still cannot continue, share the Suite version and exact error in a support ticket, keeping keys and personal details out of screenshots.

The screenshot shows the packaged interface in a UI smoke run; maintenance actions were intercepted for that screenshot. Driver installation was tested separately.
