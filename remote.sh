#!/bin/sh

set -e

sudo true

tmpfolder=$(mktemp -d /tmp/dotfiles.XXXXX)

# download repo
wget https://github.com/AnatoleLucet/dotfiles/archive/master.tar.gz -O $tmpfolder/dotfiles.tar.gz

# uncompress the archive
tar -xf $tmpfolder/dotfiles.tar.gz -C $tmpfolder

# install dotfiles
cd $tmpfolder/dotfiles-master
sh ./install.sh

# clone dotfiles at correct location for compleness
git clone https://github.com/AnatoleLucet/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
git remote remove origin
git remote add origin git@github.com:AnatoleLucet/dotfiles.git
