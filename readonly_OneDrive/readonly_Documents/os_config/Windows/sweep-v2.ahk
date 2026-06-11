; Close app

#q::Send "!{F4}"

; Switching between windows of the same application

<!`::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
ExeName := WinGetProcessName("A")
WinActivateBottom("ahk_exe " ExeName)
If WinActive("ahk_exe Explorer.EXE") {
  Send("^#{2}") ; change the number 1 to whichever position your explorer is pinned on Taskbar
  Return
}
return
} ; V1toV2: Added bracket in the end

; Run shortcuts
<^1::Run "C:\Program Files\Duplicati 2\Duplicati.GUI.TrayIcon.exe"
;<^2:: {
;    appPath := "shell:appsFolder\Microsoft.YourPhone_8wekyb3d8bbwe!App"
;    Run("explorer " appPath)
;}
<^3::Run "C:\Users\tukee\Documents\Hiddify-Windows-Portable-x64\hiddify-next\Hiddify.exe"
<^4::Run "shell:AppsFolder\MicrosoftCorporationII.Windows365_8wekyb3d8bbwe!Windows365"
<^5::Run "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe"
<^6::Run "C:\Users\tukee\AppData\Local\Programs\Bitwarden\Bitwarden.exe"
<^7::Run "shell:Appsfolder\Microsoft.WindowsAlarms_8wekyb3d8bbwe!App"

