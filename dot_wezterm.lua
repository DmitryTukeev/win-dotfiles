-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Window settings
-- config.window_decorations = "RESIZE" -- commented out for RDM window
config.initial_cols = 160
config.initial_rows = 45

-- Autostart PowerShell
config.default_prog = { 'pwsh.exe' }

-- Center WezTerm Window on Startup and open Debian Tab
wezterm.on('gui-startup', function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  -- Get the graphical window object
  local gui_window = window:gui_window()
  local screen = wezterm.gui.screens().active
  if screen then
    local dimensions = gui_window:get_dimensions()
    local center_x = (screen.width - dimensions.pixel_width) / 2
    local center_y = (screen.height - dimensions.pixel_height) / 2
    -- Reposition the window to the center
    gui_window:set_position(center_x, center_y)
    -- Tell the OS to un-minimize the window (if applicable) and force focus
    gui_window:restore()
    gui_window:focus()
  end
  -- Tell the OS to un-minimize the window (if applicable) and force focus
  if window then
    window:spawn_tab {
      domain = { DomainName = 'WSL:Debian' },
    }
  end
end)

-- Font and colors scheme
config.font =
  wezterm.font('Hack Nerd Font')
config.font_size = 12
config.color_scheme = 'OneHalfDark'

-- Key bindings
config.keys = {
  {
    key = 'l',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT|ALT',
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
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
}

-- Finally, return the configuration to wezterm:
return config
