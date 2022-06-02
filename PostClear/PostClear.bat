mode con:cols=50 lines=1
title Start work...

call :PostClear >> C:\PostClear.log 2>&1
EXIT /b 0

:PostClear
title Replacing StartMenu
taskkill /f /im StartMenuExperienceHost.exe
taskkill /f /im explorer.exe
taskkill /f /im ShellExperienceHost.exe
taskkill /f /im backgroundTaskHost.exe
taskkill /f /im ScreenClippingHost.exe
taskkill /f /im TextInputHost.exe
taskkill /f /im SearchApp.exe
TIMEOUT /T 2 /NOBREAK >nul
mkdir %windir%\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy.disable
mkdir %windir%\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy.disable
mkdir %windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy.disable
set FROM=%windir%\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.exe
set TO=%windir%\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy.disable\SearchApp.exe
takeown /f %FROM%
icacls %FROM% /grant "%username%":f /c /l /q
move %FROM% %TO%
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path %TO%"
if exist %FROM% Goto PostClear
set FROM=%windir%\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe
set TO=%windir%\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy.disable\StartMenuExperienceHost.exe
takeown /f %FROM%
icacls %FROM% /grant "%username%":f /c /l /q
move %FROM% %TO%
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path %TO%"
if exist %FROM% Goto PostClear
set FROM=%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\ScreenClippingHost.exe
set TO=%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy.disable\ScreenClippingHost.exe
takeown /f %FROM%
icacls %FROM% /grant "%username%":f /c /l /q
move %FROM% %TO%
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path %TO%"
if exist %FROM% Goto PostClear
set FROM=%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe
set TO=%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy.disable\TextInputHost.exe
takeown /f %FROM%
icacls %FROM% /grant "%username%":f /c /l /q
move %FROM% %TO%
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path %TO%"
if exist %FROM% Goto PostClear
%programdata%\PostClear\ClassicShell.msi /qn ADDLOCAL=ClassicStartMenu
xcopy /y "%programdata%\PostClear\Classic Shell" "%programfiles%\Classic Shell"
title Stopping Orchestrator
net stop UsoSvc
TIMEOUT /T 1 /NOBREAK >nul
title Applying PostClearM.reg
%programdata%\PostClear\AdvancedRun.exe /EXEFilename %windir%\regedit.exe /CommandLine "/S %programdata%\PostClear\PostClearM.reg" /RunAs 4 /WaitProcess 1 /Run
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}" /v location /t REG_SZ /d "%programfiles(x86)%\Microsoft\Edge\Application"
TIMEOUT /T 1 /NOBREAK >nul
title Disable InputSwitch bar
:InputSwitch
taskkill /f /im explorer.exe
set MOVE=%windir%\System32\InputSwitch.dll
takeown /f %MOVE%
icacls %MOVE% /grant "%username%":f /c /l /q
cscript %programdata%\PostClear\BytesReplacer.vbs %MOVE% "%MOVE%.mod" 1
del /f /q %MOVE%
if exist "%MOVE%" Goto InputSwitch
move "%MOVE%.mod" %MOVE%
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path %MOVE%"
title Disable AppX refresh
:AppX
net stop AppXSvc
set MOVE=%windir%\System32\AppXDeploymentExtensions.desktop.dll
takeown /f %MOVE%
icacls %MOVE% /grant "%username%":f /c /l /q
cscript %programdata%\PostClear\BytesReplacer.vbs %MOVE% "%MOVE%.mod" 2
del /f /q %MOVE%
if exist "%MOVE%" Goto AppX
move "%MOVE%.mod" %MOVE%
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path %MOVE%"
title Disable Settings banner
:Settings
taskkill /f /im SystemSettings.exe
set MOVE=%windir%\ImmersiveControlPanel\SystemSettings.dll
takeown /f %MOVE%
icacls %MOVE% /grant "%username%":f /c /l /q
cscript %programdata%\PostClear\BytesReplacer.vbs %MOVE% "%MOVE%.mod" 3
del /f /q %MOVE%
if exist "%MOVE%" Goto Settings
move "%MOVE%.mod" %MOVE%
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path %MOVE%"
title Deleting Edge services
sc delete edgeupdate
sc delete edgeupdatem
title Block EdgeUpdate folder
mkdir "%programfiles(x86)%\Microsoft\EdgeUpdate"
icacls "%programfiles(x86)%\Microsoft\EdgeUpdate" /deny *S-1-1-0:(W,D,X,R,RX,M,F) *S-1-5-7:(W,D,X,R,RX,M,F)
title Deleting tasks
schtasks /delete /tn Microsoft\XblGameSave\XblGameSaveTask /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\PcaPatchDbTask" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\StartupAppTask" /f
schtasks /delete /tn Microsoft\Windows\Autochk\Proxy /f
schtasks /delete /tn Microsoft\Windows\CloudExperienceHost\CreateObjectTask /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
schtasks /delete /tn Microsoft\Windows\Defrag\ScheduledDefrag /f
schtasks /delete /tn Microsoft\Windows\Diagnosis\Scheduled /f
schtasks /delete /tn Microsoft\Windows\DiskCleanup\SilentCleanup /f
schtasks /delete /tn Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector /f
schtasks /delete /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /f
schtasks /delete /tn Microsoft\Windows\Feedback\Siuf\DmClient /f
schtasks /delete /tn Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload /f
schtasks /delete /tn "Microsoft\Windows\FileHistory\File History (maintenance mode)" /f
schtasks /delete /tn Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures /f
schtasks /delete /tn Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing /f
schtasks /delete /tn Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting /f
schtasks /delete /tn Microsoft\Windows\Flighting\OneSettings\RefreshCache /f
schtasks /delete /tn Microsoft\Windows\HelloFace\FODCleanupTask /f
schtasks /delete /tn "Microsoft\Windows\International\Synchronize Language Settings" /f
schtasks /delete /tn Microsoft\Windows\LanguageComponentsInstaller\Installation /f
schtasks /delete /tn Microsoft\Windows\Maintenance\WinSAT /f
schtasks /delete /tn Microsoft\Windows\Maps\MapsToastTask /f
schtasks /delete /tn Microsoft\Windows\Maps\MapsUpdateTask /f
schtasks /delete /tn Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents /f
schtasks /delete /tn Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic /f
schtasks /delete /tn Microsoft\Windows\NetTrace\GatherNetworkInfo /f
schtasks /delete /tn "Microsoft\Windows\Offline Files\Background Synchronization" /f
schtasks /delete /tn "Microsoft\Windows\Offline Files\Logon Synchronization" /f
schtasks /delete /tn Microsoft\Windows\PI\Sqm-Tasks /f
schtasks /delete /tn "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /f
schtasks /delete /tn Microsoft\Windows\PushToInstall\LoginCheck /f
schtasks /delete /tn Microsoft\Windows\PushToInstall\Registration /f
schtasks /delete /tn Microsoft\Windows\RetailDemo\CleanupOfflineContent /f
schtasks /delete /tn Microsoft\Windows\Setup\SetupCleanupTask /f
schtasks /delete /tn Microsoft\Windows\Shell\FamilySafetyMonitor /f
schtasks /delete /tn Microsoft\Windows\Shell\FamilySafetyRefreshTask /f
schtasks /delete /tn Microsoft\Windows\Shell\IndexerAutomaticMaintenance /f
schtasks /delete /tn Microsoft\Windows\Speech\SpeechModelDownloadTask /f
schtasks /delete /tn Microsoft\Windows\Sysmain\WsSwapAssessmentTask /f
schtasks /delete /tn Microsoft\Windows\SystemRestore\SR /f
schtasks /delete /tn "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /f
schtasks /delete /tn "Microsoft\Windows\Time Synchronization\SynchronizeTime" /f
schtasks /delete /tn "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /f
schtasks /delete /tn Microsoft\Windows\UNP\RunUpdateNotificationMgr /f
schtasks /delete /tn "Microsoft\Windows\User Profile Service\HiveUploadTask" /f
schtasks /delete /tn Microsoft\Windows\WaaSMedic\PerformRemediation /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Verification" /f
schtasks /delete /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /f
schtasks /delete /tn "Microsoft\Windows\WindowsUpdate\Scheduled Start" /f
if exist %windir%\ru-RU\explorer.exe.mui (
	schtasks /create /tn "Microsoft\Windows\WindowsUpdate\Scheduled Start" /tr %windir%\explorer.exe /sc once /sd 30/11/1999 /st 00:00 /ru SYSTEM
) else (
	schtasks /create /tn "Microsoft\Windows\WindowsUpdate\Scheduled Start" /tr %windir%\explorer.exe /sc once /sd 11/30/1999 /st 00:00 /ru SYSTEM
)
schtasks /change /tn "Microsoft\Windows\WindowsUpdate\Scheduled Start" /disable
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path '%windir%\System32\Tasks\Microsoft\Windows\WindowsUpdate\Scheduled Start'"
%programdata%\PostClear\AdvancedRun.exe /EXEFilename %windir%\System32\schtasks.exe /CommandLine '/delete /tn "Microsoft\Windows\UpdateOrchestrator\Report policies" /f' /RunAs 4 /WaitProcess 1 /Run
%programdata%\PostClear\AdvancedRun.exe /EXEFilename %windir%\System32\schtasks.exe /CommandLine '/delete /tn "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /f' /RunAs 4 /WaitProcess 1 /Run
%programdata%\PostClear\AdvancedRun.exe /EXEFilename %windir%\System32\schtasks.exe /CommandLine '/delete /tn "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /f' /RunAs 4 /WaitProcess 1 /Run
%programdata%\PostClear\AdvancedRun.exe /EXEFilename %windir%\System32\schtasks.exe /CommandLine '/delete /tn "Microsoft\Windows\UpdateOrchestrator\Schedule Work" /f' /RunAs 4 /WaitProcess 1 /Run
%programdata%\PostClear\AdvancedRun.exe /EXEFilename %windir%\System32\schtasks.exe /CommandLine "/delete /tn Microsoft\Windows\UpdateOrchestrator\UpdateModelTask /f" /RunAs 4 /WaitProcess 1 /Run
%programdata%\PostClear\AdvancedRun.exe /EXEFilename %windir%\System32\schtasks.exe /CommandLine "/delete /tn Microsoft\Windows\UpdateOrchestrator\USO_UxBroker /f" /RunAs 4 /WaitProcess 1 /Run
TIMEOUT /T 1 /NOBREAK >nul
title Applying GroupPolicy
%programdata%\PostClear\LGPO.exe /m %programdata%\PostClear\GPm.pol
TIMEOUT /T 1 /NOBREAK >nul
%programdata%\PostClear\LGPO.exe /u %programdata%\PostClear\GPu.pol
TIMEOUT /T 1 /NOBREAK >nul
title Updating GroupPolicy
gpupdate /force
title Stopping SuperFetch
net stop SysMain
TIMEOUT /T 1 /NOBREAK >nul
title Deleting SuperFetch cache
for /f "tokens=*" %%i in ('dir /b /s %windir%\Prefetch\*.pf') do (
	del /f /q "%%~i"
)
title Stopping WindowsSearch
net stop WSearch
TIMEOUT /T 1 /NOBREAK >nul
title Deleting WindowsSearch cache
rd /s /q %programdata%\Microsoft\Search
title Disable ReservedStorage
Dism /Online /Set-ReservedStorageState /State:Disabled
title Disable Hibernate and Standby
powercfg /hibernate off
powercfg /change monitor-timeout-ac 10
powercfg /change monitor-timeout-dc 5
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0
title Copy Edge icons
move %programdata%\PostClear\Assets %windir%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\Assets
title Shortcuts
if exist %windir%\ru-RU\explorer.exe.mui (
	set rescom=+ Сбросить совместимость
	set resmix=+ Сбросить микшер
	set resfol=+ Сбросить папки
	set resexp=+ Перезапустить проводник
	set appxon=+ Вкл. поддержку AppX
	set appxoff=+ Выкл. поддержку AppX
	set oldcalc=Калькулятор
) else (
	set rescom=+ Reset compatibility
	set resmix=+ Reset mixer
	set resfol=+ Reset folders
	set resexp=+ Restart explorer
	set appxon=+ Enable AppX support
	set appxoff=+ Disable AppX support
	set oldcalc=Calculator
)
cscript %programdata%\PostClear\Shortcut.vbs "%programdata%\Microsoft\Windows\Start Menu\Programs\System Tools\%rescom%.lnk" "%programdata%\PostClear\Shortcuts\Compatibility.bat"
cscript %programdata%\PostClear\Shortcut.vbs "%programdata%\Microsoft\Windows\Start Menu\Programs\System Tools\%resmix%.lnk" "%programdata%\PostClear\Shortcuts\MixerReset.bat"
cscript %programdata%\PostClear\Shortcut.vbs "%programdata%\Microsoft\Windows\Start Menu\Programs\System Tools\%resfol%.lnk" "%programdata%\PostClear\Shortcuts\ResetFolders.bat"
cscript %programdata%\PostClear\Shortcut.vbs "%programdata%\Microsoft\Windows\Start Menu\Programs\System Tools\%resexp%.lnk" "%programdata%\PostClear\Shortcuts\RestartExplorer.bat"
cscript %programdata%\PostClear\Shortcut.vbs "%programdata%\Microsoft\Windows\Start Menu\Programs\System Tools\%appxon%.lnk" "%programdata%\PostClear\Shortcuts\AppxON.reg"
cscript %programdata%\PostClear\Shortcut.vbs "%programdata%\Microsoft\Windows\Start Menu\Programs\System Tools\%appxoff%.lnk" "%programdata%\PostClear\Shortcuts\AppxOFF.reg"
cscript %programdata%\PostClear\Shortcut.vbs "%programdata%\Microsoft\Windows\Start Menu\Programs\Accessories\%oldcalc%.lnk" "%windir%\System32\calc.exe"
rd /s /q "%programdata%\Microsoft\Windows\Start Menu\Programs\Classic Shell"
del /f /q "%userprofile%\Desktop\Microsoft Edge.lnk"
title Applying PostClear.reg
start /w %windir%\regedit.exe /S %programdata%\PostClear\PostClear.reg
TIMEOUT /T 1 /NOBREAK >nul
title Finality
rd /s /q "%programdata%\PostClear\Classic Shell"
del /f /q %programdata%\PostClear\AdvancedRun.exe
del /f /q %programdata%\PostClear\ClassicShell.msi
del /f /q %programdata%\PostClear\GPm.pol
del /f /q %programdata%\PostClear\GPu.pol
del /f /q %programdata%\PostClear\LGPO.exe
del /f /q %programdata%\PostClear\BytesReplacer.vbs
del /f /q %programdata%\PostClear\PostClearM.reg
del /f /q %programdata%\PostClear\Shortcut.vbs
title Rebooting...
SHUTDOWN -r -t 3
move /y %programdata%\PostClear\PostClearU.bat %programdata%\PostClear\PostClear.bat
