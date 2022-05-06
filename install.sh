#!/bin/sh

set -e

if [ -x "$(command -v pacman)" ]; then
	./arch.sh
elif [ "$(cat /proc/1/sched | head -n 1 | grep "^bash\|sh")" ]; then
	if [ -x "$(command -v apt)"  ]; then
		./docker-ubuntu.sh
	else
		echo "Unsupported docker image. Exiting."
		exit 1
	fi
else
	echo "Unsupported distro. Exiting."
	exit 1
fi
