-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Window settings
config.window_decorations = "RESIZE"
config.initial_cols = 160
config.initial_rows = 45

-- Autostart PowerShell
config.default_prog = { 'pwsh.exe' }

-- Font and colors scheme
config.font =
  wezterm.font('Hack Nerd Font')
config.font_size = 12
config.color_scheme = 'OneHalfDark'

-- Key bindings
config.keys = {
  {
    key = 'l',
    mods = 'CTRL|ALT|',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'j',
    mods = 'CTRL|ALT|',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'n',
    mods = 'CTRL|ALT',
    action = wezterm.action.SpawnCommandInNewTab {
        domain = { DomainName = 'WSL:Debian' },
        cwd    = "~",
    },
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
}

-- Finally, return the configuration to wezterm:
return config
