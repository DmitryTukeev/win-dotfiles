-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Window settings
wezterm.on("gui-startup", function(cmd)
  local screen            = wezterm.gui.screens().active
  local ratio             = 0.6
  local width, height     = screen.width * ratio, screen.height * ratio
  local tab, pane, window = wezterm.mux.spawn_window {
    position = {
      x = (screen.width - width) / 2,
      y = (screen.height - height) / 2,
      origin = 'ActiveScreen' }
  }
  -- window:gui_window():maximize()
  window:gui_window():set_inner_size(width, height)
end)

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
  -- {
  --   key = 'h',
  --   mods = 'CTRL',
  --   action = wezterm.action.ActivatePaneDirection 'Left',
  -- },
  -- {
  --   key = 'j',
  --   mods = 'CTRL',
  --   action = wezterm.action.ActivatePaneDirection 'Down',
  -- },
  -- {
  --   key = 'k',
  --   mods = 'CTRL',
  --   action = wezterm.action.ActivatePaneDirection 'Up',
  -- },
  -- {
  --   key = 'l',
  --   mods = 'CTRL',
  --   action = wezterm.action.ActivatePaneDirection 'Right',
  -- },
  {
    key = 'n',
    mods = 'CTRL|ALT',
    action = wezterm.action.SpawnCommandInNewTab {
        domain = { DomainName = 'WSL:Debian' },
        cwd    = "~",
    },
  },
}

-- Finally, return the configuration to wezterm:
return config
