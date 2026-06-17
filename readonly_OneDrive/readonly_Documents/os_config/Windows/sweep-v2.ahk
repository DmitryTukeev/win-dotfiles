; Close app

#q::Send "!{F4}"
+RButton::Send "{Enter}"

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
!1::Run "C:\Users\tukee\Documents\Hiddify-Windows-Portable-x64\hiddify-next\Hiddify.exe"
!2::Run "shell:AppsFolder\MicrosoftCorporationII.Windows365_8wekyb3d8bbwe!Windows365"
!3::Run "C:\Users\tukee\AppData\Local\Programs\Bitwarden\Bitwarden.exe"
!4::Run "shell:Appsfolder\Microsoft.WindowsAlarms_8wekyb3d8bbwe!App"

