#!/bin/sh

set -e

if [ -x "$(command -v pacman)" ]; then
	./arch.sh
elif [ -e "/home/codespace" ]; then
	if [ "$(lsb_release -d | grep Ubuntu)" ]; then
		./codespace-ubuntu.sh
	else
		echo "Unsupported codespace image. Exiting."
		exit 1
	fi
else
	echo "Unsupported distro. Exiting."
	exit 1
fi