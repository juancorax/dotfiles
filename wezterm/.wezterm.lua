local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Kanagawa Dragon (Gogh)'

config.font = wezterm.font_with_fallback {
  'DejaVuSansM Nerd Font Mono',
  'Noto Sans Mono CJK JP',
  'IPAexGothic'
}
config.font_size = 15

config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
