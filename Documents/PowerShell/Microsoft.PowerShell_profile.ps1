oh-my-posh init pwsh --config C:\Users\tukee\Documents\PowerShell\omp_win_conf.toml | Invoke-Expression

Set-PSReadLineOption -Colors @{
    "Parameter" = "White" # The flags (e.g., -Force)
    "Operator"  = "White"   # Pipe |, equal =, etc.
}

function c {
	clear
}
function e {
	exit
}
function l {
	eza -alF --icons
}
function lt {
	eza -alF --icons -T -L3
}
function p {
	pwd
}
function ws {
	wsl --shutdown
}
function wl {
	wsl -l -v
}
function upd {
	winget upgrade --all
}
function f {
	yazi	
}
function v {
	nvim	
}
function lg {
	lazygit	
}
function ssh-sel {
  ssh -p 2222 sel@localhost
}
function ssh-sel2 {
  ssh -p 2223 sel2@localhost
}
function vl {
  VBoxManage list vms
}
function vrl {
  VBoxManage list runningvms
}
function sel-run {
  VBoxManage startvm Selectos --type headless
}
function sel2-run {
  VBoxManage startvm Selectos2 --type headless
}
function sel-stop {
  VBoxManage controlvm Selectos acpipowerbutton
}
function sel2-stop {
  VBoxManage controlvm Selectos2 acpipowerbutton
}
Invoke-Expression (& { (zoxide init powershell | Out-String) })
