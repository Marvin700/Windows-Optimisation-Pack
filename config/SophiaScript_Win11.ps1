# Windows_Optimisation_Pack @Marvin700
# windows-optimisation.de

<#
	Version: v6.6.2

	Copyright (c) 2014—2024 farag
	Copyright (c) 2019—2024 farag & Inestic

	https://github.com/farag2
	https://github.com/Inestic
#>

[CmdletBinding()]
param
(
	[Parameter(Mandatory = $false)]
	[string[]]
	$Functions
)

Clear-Host

$Host.UI.RawUI.WindowTitle = "Windows_Optimisation_Pack Sophia Script | $([char]0x00A9) farag & Inestic, 2014$([char]0x2013)2024"

Remove-Module -Name Sophia -Force -ErrorAction Ignore
Import-Module -Name $PSScriptRoot\Manifest\Sophia.psd1 -PassThru -Force
Import-LocalizedData -BindingVariable Global:Localization -BaseDirectory $PSScriptRoot\Localizations -FileName Sophia

if ($Functions){
Invoke-Command -ScriptBlock {InitialActions}
foreach ($Function in $Functions)
{Invoke-Expression -Command $Function}
exit}

# The mandatory checks
InitialActions

# Disable the "Connected User Experiences and Telemetry" service (DiagTrack), and block the connection for the Unified Telemetry Client Outbound Traffic
# Disabling the "Connected User Experiences and Telemetry" service (DiagTrack) can cause you not being able to get Xbox achievements anymore
DiagTrackService -Disable

# Turn off the diagnostics tracking scheduled tasks
ScheduledTasks -Disable

# Disable the Windows features using the pop-up dialog box
WindowsFeatures -Disable

# Uninstall optional features using the pop-up dialog box
WindowsCapabilities -Uninstall

# Uninstall UWP apps using the pop-up dialog box
UninstallUWPApps

# Set the diagnostic data collection to minimum
DiagnosticDataLevel -Minimal

# Turn off the Windows Error Reporting
ErrorReporting -Disable

# Change the feedback frequency to "Never"
FeedbackFrequency -Never

# Do not show websites from your browsing history in the Start menu
BrowsingHistory -Hide

# Do not use sign-in info to automatically finish setting up device after an update
SigninInfo -Disable

# Do not let websites provide locally relevant content by accessing language list
LanguageListAccess -Disable

# Do not let apps show me personalized ads by using my advertising ID
AdvertisingID -Disable

# Hide the Windows welcome experiences after updates and occasionally when I sign in to highlight what's new and suggested
WindowsWelcomeExperience -Hide

# Do not get tips and suggestions when I use Windows
WindowsTips -Disable

# Hide from me suggested content in the Settings app
SettingsSuggestedContent -Hide

# Turn off automatic installing suggested apps
AppsSilentInstalling -Disable

# Disable suggestions on how I can set up my device
WhatsNewInWindows -Disable

# Don't let Microsoft use your diagnostic data for personalized tips, ads, and recommendations
TailoredExperiences -Disable

# Disable Bing search in the Start Menu
BingSearch -Disable

# Do not use item check boxes
CheckBoxes -Disable

# Show hidden files, folders, and drives
HiddenItems -Enable

# Show the file name extensions
FileExtensions -Show

# Show folder merge conflicts
MergeConflicts -Show

# Disable the File Explorer compact mode
FileExplorerCompactMode -Disable

# Do not show sync provider notification within File Explorer
OneDriveFileExplorerAd -Hide

# When I snap a window, do not show what I can snap next to it
SnapAssist -Disable

# Show the file transfer dialog box in the detailed mode
FileTransferDialog -Detailed

# Display the recycle bin files delete confirmation dialog
RecycleBinDeleteConfirmation -Enable

# Hide recently used files in Quick access
QuickAccessRecentFiles -Hide

# Hide frequently used folders in Quick access
QuickAccessFrequentFolders -Hide

# Set the taskbar alignment to the left
TaskbarAlignment -Left

# Hide the search button from the taskbar
TaskbarSearch -Hide

# Hide search highlights
SearchHighlights -Hide

# Hide Copilot button on the taskbar
CopilotButton -Hide

# Hide the Task view button from the taskbar
TaskViewButton -Hide

# Hide the widgets icon on the taskbar
TaskbarWidgets -Hide

# Hide the Chat icon (Microsoft Teams) on the taskbar and prevent Microsoft Teams from installing for new users
PreventTeamsInstallation -Enable

# Combine taskbar buttons and always hide labels (default value)
TaskbarCombine -Always

# Unpin the "Microsoft Edge", "Microsoft Store" shortcuts from the taskbar
UnpinTaskbarShortcuts -Shortcuts Edge, Store

# View the Control Panel icons by category
ControlPanelView -Category

# Set the default Windows mode to dark
WindowsColorMode -Dark

# Set the default app mode to dark
AppColorMode -Dark

# Hide first sign-in animation after the upgrade
FirstLogonAnimation -Disable

# Set the quality factor of the JPEG desktop wallpapers to maximum
JPEGWallpapersQuality -Max

# Notify me when a restart is required to finish updating
RestartNotification -Show

# Do not add the "- Shortcut" suffix to the file name of created shortcuts
ShortcutsSuffix -Disable

# Use the Print screen button to open screen snipping
PrtScnSnippingTool -Enable

# Do not use a different input method for each app window
AppsLanguageSwitch -Disable

# When I grab a windows's title bar and shake it, minimize all other windows
AeroShaking -Enable

# Do not group files and folder in the Downloads folder
FolderGroupBy -None

# Uninstall OneDrive. The OneDrive user folder won't be removed
OneDrive -Uninstall

# Turn on Storage Sense
StorageSense -Enable

# Run Storage Sense every month
StorageSenseFrequency -Month

# Turn on automatic cleaning up temporary system and app files
StorageSenseTempFiles -Enable

# Disable hibernation. Do not recommend turning it off on laptops
IF(!(Get-WmiObject -Class win32_systemenclosure | Where-Object { $_.chassistypes -eq 8 -or $_.chassistypes -eq 9 -or $_.chassistypes -eq 10 -or $_.chassistypes -eq 14 -or $_.chassistypes -eq 30}))
{Hibernation -Disable}

# Disable the Windows 260 characters path limit
Win32LongPathLimit -Disable

# Display the Stop error information on the BSoD
BSoDStopError -Enable

# Choose when to be notified about changes to your computer: never notify
AdminApprovalMode -Never

# Turn on access to mapped drives from app running with elevated permissions with Admin Approval Mode enabled
MappedDrivesAppElevatedAccess -Enable

# Turn off Delivery Optimization
DeliveryOptimization -Disable

# Always wait for the network at computer startup and logon for workgroup networks
WaitNetworkStartup -Enable

# Do not let Windows manage my default printer
WindowsManageDefaultPrinter -Disable

# Receive updates for other Microsoft products
UpdateMicrosoftProducts -Enable

# Set power plan on "Balanced"
PowerPlan -Balanced

# Do not allow the computer to turn off the network adapters to save power
NetworkAdaptersSavePower -Disable

# Disable the Internet Protocol Version 6 (TCP/IPv6) component for all network connections
# IPv6Component -Disable

# Save screenshots by pressing Win+PrtScr on the Desktop
WinPrtScrFolder -Desktop

# Run troubleshooter automatically, then notify me
RecommendedTroubleshooting -Automatically

# Launch folder windows in a separate process
FoldersLaunchSeparateProcess -Enable

# Disable and delete reserved storage after the next update installation
ReservedStorage -Disable

# Disable help lookup via F1
F1HelpPage -Disable

# Enable Num Lock at startup
NumLock -Enable

# Turn off pressing the Shift key 5 times to turn Sticky keys
StickyShift -Disable

# Don't use AutoPlay for all media and devices
Autoplay -Disable

# Enable thumbnail cache removal
ThumbnailCacheRemoval -Enable

# Turn off automatically saving my restartable apps and restart them when I sign back in
SaveRestartableApps -Disable

# Enable "Network Discovery" and "File and Printers Sharing" for workgroup networks
NetworkDiscovery -Enable

# Automatically adjust active hours for me based on daily usage
ActiveHours -Automatically

# Restart as soon as possible to finish updating
RestartDeviceAfterUpdate -Enable

# Set Windows Terminal as default terminal app to host the user interface for command-line applications
DefaultTerminalApp -WindowsTerminal

# List Microsoft Edge channels to prevent desktop shortcut creation upon its' update
PreventEdgeShortcutCreation -Channels Stable, Beta, Dev, Canary

# Prevent all internal SATA drives from showing up as removable media in the taskbar notification area
SATADrivesRemovableMedia -Disable

# Show more pins on Start (for 22509+ build only)
StartLayout -ShowMorePins

# Disable Cortana autostarting
CortanaAutostart -Disable

# Disable Microsoft Teams autostarting
TeamsAutostart -Disable

# Disable Xbox Game Bar tips
XboxGameTips -Disable

# Turn on hardware-accelerated GPU scheduling. Restart needed
GPUScheduling -Enable

# Create the "Windows Cleanup" scheduled task for cleaning up Windows unused files and updates
# A native interactive toast notification pops up every 30 days. The task runs every 30 days
CleanupTask -Register

# Create the "SoftwareDistribution" scheduled task for cleaning up the %SystemRoot%\SoftwareDistribution\Download folder
# The task will wait until the Windows Updates service finishes running. The task runs every 90 days
SoftwareDistributionTask -Register

# Create the "Temp" scheduled task for cleaning up the %TEMP% folder
# Only files older than one day will be deleted. The task runs every 60 days
TempTask -Register

# Disable Microsoft Defender Exploit Guard network protection
NetworkProtection -Disable

# Disable detection for potentially unwanted applications and block them
PUAppsDetection -Disable

# Dismiss Microsoft Defender offer in the Windows Security about signing in Microsoft account
DismissMSAccount

# Dismiss Microsoft Defender offer in the Windows Security about turning on the SmartScreen filter for Microsoft Edge
DismissSmartScreenFilter

# Enable events auditing generated when a process is created (starts)
AuditProcess -Enable

# Include command line in process creation events
CommandLineProcessAudit -Enable

# Create the "Process Creation" сustom view in the Event Viewer to log executed processes and their arguments
# In order this feature to work events auditing (AuditProcess -Enable) and command line (CommandLineProcessAudit -Enable) in process creation events will be enabled
EventViewerCustomView -Enable

# Enable logging for all Windows PowerShell modules
PowerShellModulesLogging -Enable

# Enable logging for all PowerShell scripts input to the Windows PowerShell event log
PowerShellScriptsLogging -Enable

# Microsoft Defender SmartScreen doesn't marks downloaded files from the Internet as unsafe
AppsSmartScreen -Disable

# Disable the Attachment Manager marking files that have been downloaded from the Internet as unsafe
SaveZoneInformation -Disable

# Disable Windows Sandbox
WindowsSandbox -Disable

# Enable DNS-over-HTTPS for IPv4
DNSoverHTTPS -Enable -PrimaryDNS 1.0.0.1 -SecondaryDNS 1.1.1.1

# Show the "Extract all" item in the Windows Installer (.msi) context menu
MSIExtractContext -Show

# Show the "Install" item in the Cabinet (.cab) filenames extensions context menu
CABInstallContext -Show

# Hide the "Run as different user" item from the .exe filename extensions context menu
RunAsDifferentUserContext -Hide

# Hide the "Cast to Device" item from the media files and folders context menu
CastToDeviceContext -Hide

# Hide the "Share" item from the context menu
ShareContext -Hide

# Hide the "Edit with Clipchamp" item from the media files context menu
EditWithClipchampContext -Hide

# Hide the "Print" item from the .bat and .cmd context menu
PrintCMDContext -Hide

# Hide the "Include in Library" item from the folders and drives context menu
IncludeInLibraryContext -Hide

# Hide the "Send to" item from the folders context menu
SendToContext -Hide

# Hide the "Compressed (zipped) Folder" item from the "New" context menu
CompressedFolderNewContext -Hide

# Enable the "Open", "Print", and "Edit" context menu items for more than 15 items selected
MultipleInvokeContext -Enable

# Hide the "Look for an app in the Microsoft Store" item in the "Open with" dialog
UseStoreOpenWith -Hide

# Show the "Open in Windows Terminal" item in the folders context menu
OpenWindowsTerminalContext -Show

# Open Windows Terminal in context menu as administrator by default
OpenWindowsTerminalAdminContext -Enable

# Disable the Windows 10 context menu style
Windows10ContextMenu -Disable

# SIG # Begin signature block
# MIIFiwYJKoZIhvcNAQcCoIIFfDCCBXgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUt6ht8y+FLK3Vf1or8HMKrr9e
# q5qgggMcMIIDGDCCAgCgAwIBAgIQJBEmIU6B/6pL+Icl+8AGsDANBgkqhkiG9w0B
# AQsFADAkMSIwIAYDVQQDDBlXaW5kb3dzX09wdGltaXNhdGlvbl9QYWNrMB4XDTIy
# MTAwMzA5NTA0MloXDTMwMTIzMTIyMDAwMFowJDEiMCAGA1UEAwwZV2luZG93c19P
# cHRpbWlzYXRpb25fUGFjazCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
# AMqbrd2/6x589A5LablKK+Ed5zN+CoIBO/0DtWoJ7mxT+4IWA+0d5kWYTUW/MI7Y
# BHS5r7kuUe1SX2E90CVKVKk7HVrbMCv707M+PWWQs+D0Q9vrXqMEcuEmoRcrQH7j
# kTzs+Y4kKAkD/8Je1+5uBpyu6H1FTH9290no+h9bgvCp5UrhzzFJkVyRjCXJLlbV
# NgLEWPDFa0mMEVNoXxa7m9AwnCNSCUMGEVhPzIMameK0W9jEKPTxfPdXhRWTu4lz
# 7vzp5HBvn3XdutyJhH1+txCgc6uNJe/kxZENvHTObRWxkMotq8x3GqjuvNpY3t3O
# MndeMCYiI84GBuixSXeaXf0CAwEAAaNGMEQwDgYDVR0PAQH/BAQDAgWgMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBSOhOkyv1Z+aPC/kWeVNpKwbI3omjAN
# BgkqhkiG9w0BAQsFAAOCAQEAku31A0acjtrpBqJn7nwifNv5EmiryXeGZm0RCflv
# /JRIyvjHMDvo7Mb9p4VTRciZt2kyIDzefda1XU597frO4TgNlBgH816TxMJ4qZlb
# ScZXc/zhBOu51oA53gt641h0zhp5dJpP/gE8VFhBUV0IVTBPnunEK1hpYmGLftAe
# 3FjiDRQ+b+q/zT0uUbrFdyYHnlyL40bPl3XVDwVaJhDGW7At/s1K4ZA96Xej5Wxa
# ffqIOiTEjscTmVeXLCf44EiyxZ0vF20BWwvCosONptr1MyQXFI5azArQOU9BfhYL
# rJXoqIvVp1G2GWcfqZGLAoxnidVEN1ndnbkEFCpWeNcAkzGCAdkwggHVAgEBMDgw
# JDEiMCAGA1UEAwwZV2luZG93c19PcHRpbWlzYXRpb25fUGFjawIQJBEmIU6B/6pL
# +Icl+8AGsDAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZ
# BgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYB
# BAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUogvTb5UujUtMzrP8zzOuCv+8qscwDQYJ
# KoZIhvcNAQEBBQAEggEAceoiZOuvyHxZ+b/gQhv+nprDGRsq7CRQWmsL4qjPursL
# ImfSUnLGaXT88UCRrir81e1UAGhLATljb0K570vu+iVvITx8VHVSd3EBA4iEVNku
# /0WyE8hc28s8nf92hbVTnarGc25IWUtFdefys6CHkw0ROq1je/BlqWcMC+PgRpYl
# mkF572Lpl0bErd4E/8tm/9vbNVEu2eY1KmHf0v474G242hDH/VIbiKvHrEZe2gOr
# p0eQCP9vGD0J9kNTfm8MHqjOcbk74y19hY7KNbVZu+yhraDXiOITp1EazmSFTZ8k
# 0FuomLzp8abtjbcozoCyksXR6u6VGqiPzDIk7EWEnQ==
# SIG # End signature block
