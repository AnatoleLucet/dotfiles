#!/bin/sh

set -e

wget https://github.com/AnatoleLucet/dotfiles/archive/master.tar.gz -O /tmp/dotfiles.tar.gz
tar -xf /tmp/dotfiles.tar.gz -C $HOME/.dotfiles
rm /tmp/dotfiles.tar.gz
sh $HOME/.dotfiles/install.sh
