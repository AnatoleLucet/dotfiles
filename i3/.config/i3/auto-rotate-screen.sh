#!/bin/sh

# https://gist.github.com/mortie/e725d37a71779b18e8eaaf4f8a02bf5b
# Automatically rotate the screen when the device's orientation changes.
# Use 'xrandr' to get the correct display for the first argument (for example, "eDP-1"),
# and 'xinput' to get the correct input element for your touch screen, if applicable
# (for example,  "Wacom HID 486A Finger").
#
# The script depends on the monitor-sensor program from the iio-sensor-proxy package.

if [ -z "$1" ]; then
	echo "Usage: $0 <display> [touchinput]"
	exit 1
fi

monitor-sensor \
	| grep --line-buffered "Accelerometer orientation changed" \
	| grep --line-buffered -o ": .*" \
	| while read -r line; do
		line="${line#??}"
		if [ "$line" = "normal" ]; then
			rotate=normal
			matrix="0 0 0 0 0 0 0 0 0"
		elif [ "$line" = "left-up" ]; then
			rotate=left
			matrix="0 -1 1 1 0 0 0 0 1"
		elif [ "$line" = "right-up" ]; then
			rotate=right
			matrix="0 1 0 -1 0 1 0 0 1"
		elif [ "$line" = "bottom-up" ]; then
			rotate=inverted
			matrix="-1 0 1 0 -1 1 0 0 1"
		else
			echo "Unknown rotation: $line"
			continue
		fi

		xrandr --output "$1" --rotate "$rotate"
		if ! [ -z "$2" ]; then
			xinput set-prop "$2" --type=float "Coordinate Transformation Matrix" $matrix
		fi
	done
