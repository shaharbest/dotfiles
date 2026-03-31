local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local theme_file = os.getenv('HOME') .. '/.config/theme'

local function read_theme()
  local f = io.open(theme_file, 'r')
  if not f then return 'dark' end
  local t = f:read('*l')
  f:close()
  return t or 'dark'
end

config.font_size = 20.0
config.color_scheme = read_theme() == 'light' and 'Catppuccin Latte' or 'Catppuccin Mocha'

return config
