local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
  -- 'PragmataPro Mono Liga',

  "Iosevka Custom",
  "IosevkaCustom Nerd Font Mono",
  -- "Maple Mono NF CN",
})
config.line_height = 1.05
config.font_size = 12
-- config.harfbuzz_features = { 'ss09', 'calt' }
config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = true
config.window_background_opacity = 1
config.macos_window_background_blur = 70
config.text_background_opacity = 1

config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

return config
