#!/bin/bash

set -e

customKeybindIndex=0
bind() {
  list=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
  p="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${customKeybindIndex}/"

  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$p name "'$1'"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$p binding "'$2'"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$p command "'$3'"
  gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "${list:0:-1}, '$p']"

  customKeybindIndex=$((customKeybindIndex+1))
}

# make sure the custom keybindings array is empty before declaring our own
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[]"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><shift>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Super><shift>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Super><shift>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Super><shift>9']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><shift>0']"

gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>l']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Super>h']"

gsettings set org.gnome.desktop.wm.keybindings close "['<Super><shift>a']"

bind "Terminal" "<Super>Return" "kitty"
# bind "Terminal" "<Super>Return" "wezterm"
# bind "Terminal last dir" "<Super><shift>Return" 'bash -c "zsh ~/.config/i3/open-term-in-last-dir.sh"'
bind "Suspend" "<Super>Escape" "systemctl suspend"
bind "Screenshot" "<Super><shift>i" "gnome-screenshot -a -i"

gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
