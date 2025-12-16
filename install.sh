#!/bin/sh

set -e

if [ -x "$(command -v pacman)" ]; then
	if [ -d "$HOME/.local/share/omarchy" ]; then
    ./omarchy.sh
    exit 0
  fi

	./arch.sh
elif [ "$(cat /proc/1/sched | head -n 1 | grep "^bash\|sh")" ]; then
	if [ -x "$(command -v apt)" ]; then
		./docker-ubuntu.sh
    exit 0
  fi

  echo "Unsupported docker image. Exiting."
  exit 1
else
  echo "Unsupported distro. Exiting."
  exit 1
fi
