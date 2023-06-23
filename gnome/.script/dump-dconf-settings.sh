#!/bin/bash

set -e

dconf dump / > ~/.config/dconf/user.conf
