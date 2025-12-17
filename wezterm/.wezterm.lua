local DESKTOP = os.getenv("XDG_CURRENT_DESKTOP") or os.getenv("DESKTOP_SESSION") or ""
local PROG = os.getenv("WEZTERM_PROGRAM") or "tmux attach || tmux"

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

config.window_frame = {
  font = font,
  font_size = 6,
  active_titlebar_bg = "#1a1b26",
  inactive_titlebar_bg = "#1a1b26",
}

if DESKTOP:match("Hyprland") then
  config.window_padding = { left = 12, right = 12, top = 14, bottom = 4 }
else
  config.window_decorations = "RESIZE"
  config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

  wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
    window:gui_window():toggle_fullscreen()
  end)
end

print(PROG)

config.default_prog = { "/bin/bash", "-c", PROG }

return config
