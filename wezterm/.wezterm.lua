local wezterm = require("wezterm")
local config = wezterm.config_builder()

local font = wezterm.font("MonoLisa Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" })
local font_size = 9

config.font = font
config.font_size = font_size

config.colors = {
  foreground = "#c0caf5",
  background = "#1a1b26",
  cursor_bg = "#c0caf5",
  cursor_border = "#c0caf5",
  cursor_fg = "#1a1b26",
  selection_bg = "#2e3c64",
  selection_fg = "#c0caf5",
  split = "#7aa2f7",
  compose_cursor = "#ff9e64",
  scrollbar_thumb = "#292e42",

  ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
  brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
}

config.enable_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_frame = {
  font = font,
  font_size = 6,
  active_titlebar_bg = "#1a1b26",
  inactive_titlebar_bg = "#1a1b26",
}
config.window_decorations = "RESIZE"

config.default_prog = { "tmux", "attach" }

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
  window:gui_window():toggle_fullscreen()
end)

return config
