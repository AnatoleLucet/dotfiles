#!/bin/sh

set -e

if [ -x "$(command -v pacman)" ]; then
	./arch.sh
else
	echo "Unsupported distro. Exiting."
	exit 1
fi