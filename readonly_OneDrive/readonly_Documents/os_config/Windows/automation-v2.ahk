; my shortcuts

CapsLock::LControl

<^q::Send "{Esc}"
<^[::Send "{Esc}"
+RButton::Send "{Enter}"
<^/::Send "{?}"
<^.::Send "{:}"
<^m::Send "^+{1}"
<^,::Send "^+{2}"
<^9::Send "{[}"
<^0::Send "{]}"
<^!9::Send "{{}"
<^!0::Send "{}}"

<^1::Send "#^{Left}"
<^2::Send "#^{Right}"

<!1::Send "#5"
<!2::Send "#6"
<!3::Send "#7"
<!4::Send "#8"
<!5::Send "#9"
<!6::Send "#0"

<!a::Send "^{a}"
<!s::Send "^{s}"
<!z::Send "^{z}"
<!x::Send "^{x}"
<!c::Send "^{c}"
<!v::Send "^{v}"
<!+v::Send "^+{v}"
<!f::Send "^{f}"
<!r::Send "^{r}"
<!t::Send "^{t}"
<!+t::Send "^+{t}"
<!d::Send "{Backspace}"
<!+d::Send "{Del}"
<!w::Send "^{Tab}"
<!q::Send "^+{Tab}"
<!m::Send "^+{Esc}"
#q::Send "!{F4}"

; numpad
																		
<^+m::Send "{Numpad1}"		
<^+,::Send "{Numpad2}"
<^+.::Send "{Numpad3}"
<^+j::Send "{Numpad4}"
<^+k::Send "{Numpad5}"
<^+l::Send "{Numpad6}"
<^+u::Send "{Numpad7}"
<^+i::Send "{Numpad8}"
<^+o::Send "{Numpad9}"
<^+Space::Send "{Numpad0}"
<^+;::Send "{+}"
<^+p::Send "{-}"


; vim style cursor movement

<!h::Send "{LEFT}"         ; ALT + h                   ->    LEFT                (Cursor left one character)
<!^h::Send "^{LEFT}"       ; ALT + CTRL + h            ->    CTRL + LEFT         (Cursor left per word)
<!+h::Send "+{LEFT}"       ; ALT + SHIFT + h           ->    SHIFT + LEFT        (Select one character)
<!^+h::Send "+^{LEFT}"     ; ALT + CTRL + SHIFT + h    ->    SHIFT + CTRL + LEFT (Select per word)

<!l::Send "{RIGHT}"        ; ALT + l                   ->    RIGHT                (Cursor right one character)
<!^l::Send "^{RIGHT}"      ; ALT + CTRL + l            ->    CTRL + RIGHT         (Cursor right per word)
<!+l::Send "+{RIGHT}"      ; ALT + SHIFT + l           ->    SHIFT + RIGHT        (Select one character)
<!^+l::Send "+^{RIGHT}"    ; ALT + CTRL + SHIFT + l    ->    SHIFT + CTRL + RIGHT (Select per word)

<!k::Send "{UP}"           ; ALT + k                   ->    UP                   (Cursor up line)
<!+k::Send "+{UP}"         ; ALT + SHIFT + k           ->    SHIFT + UP           (Select one line)

<!j::Send "{DOWN}"         ; ALT + j                   ->    LEFT                 (Cursor down line)
<!+j::Send "+{DOWN}"       ; ALT + SHIFT + j           ->    SHIFT + LEFT         (Select one line)

<!u::Send "{HOME}"         ; ALT + u                   ->    HOME                 (Cursor to beginning of line)
<!+u::Send "+{HOME}"       ; ALT + SHIFT + u           ->    SHIFT + HOME         (Select to beginning of line)

<!p::Send "{END}"          ; ALT + p                   ->    END                  (Cursor to end of line)
<!+p::Send "+{END}"        ; ALT + SHIFT + p           ->    SHIFT + END          (Select to end of line)

<!o::Send "{PgUp}"         ; ALT + o                   ->    PgUp                 (Switch up one paragraph)
<!+o::Send "+{PgUp}"       ; ALT + SHIFT + o           ->    SHIFT + PgUp         (Select up one paragraph)
<!i::Send "{PgDn}"         ; ALT + i                   ->    PgDn                 (Switch down one paragraph)
<!+i::Send "+{PgDn}"       ; ALT + SHIFT + i           ->    SHIFT + PgDn         (Select down one paragraph)


; switching between windows of the same application

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

; run shortcuts

^3::Run "C:\Users\tukee\Documents\Hiddify-Windows-Portable-x64\hiddify-next\Hiddify.exe"
^4::Run "C:\Program Files\Remote Desktop\msrdcw.exe"
^5::Run "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe"
^6::Run "C:\Users\tukee\AppData\Local\Programs\Bitwarden\Bitwarden.exe"
^7::Run "shell:Appsfolder\Microsoft.WindowsAlarms_8wekyb3d8bbwe!App"
^8::Run "onenote-cmd://"

>!2::
{
    url := "https://partner.microsoft.com/en-us/dashboard/commerce2/customers/list"
        Send ">^l"
        Send url
	Send "{Enter}"
}
