# displays
xrandr --output HDMI-1 --off
xrandr --output HDMI-2 --auto --above eDP-1

# input
xset r rate 150 50
setxkbmap -option caps:backspace
setxkbmap -option shift:both_capslock
xmodmap -e "clear Lock"
