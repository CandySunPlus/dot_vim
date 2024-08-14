local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
  {
    family = 'BlexMono Nerd Font Mono',
    weight = 'Regular'
  },
  'Maple Mono NF CN'
}
config.color_scheme = 'Catppuccin Mocha'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.window_background_opacity = 0.9
config.macos_window_background_blur = 70
config.text_background_opacity = 0.9

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 5
}

return config
