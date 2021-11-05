#!/bin/sh

# displays
xrandr --output HDMI-1 --off
xrandr --output HDMI-2 --auto --above eDP-1
xrandr --output eDP-1 --dpi 95

# input
xset r rate 150 50
setxkbmap -option caps:backspace
setxkbmap -option shift:both_capslock
xmodmap -e "clear Lock"
# xinput --set-prop $(xinput list | grep Touchpad | sed "s/.*id=\([[:digit:]]*\).*/\1/g") "libinput Tapping Enabled" 1
touchpadId=$(xinput list | grep Touchpad | sed "s/.*id=\([[:digit:]]*\).*/\1/g")
xinput set-prop $touchpadId "libinput Tapping Enabled" 1
xinput set-prop $touchpadId "libinput Tapping Button Mapping Enabled" 0, 1

# battery
powertop --auto-tune
