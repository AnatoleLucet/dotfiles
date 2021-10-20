#!/bin/sh

pgrep polybar | xargs -r kill

# polybar main

for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload main &
done
