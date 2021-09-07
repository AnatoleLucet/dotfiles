#!/bin/sh

set -e

sudo true

# download repo
wget https://github.com/AnatoleLucet/dotfiles/archive/master.tar.gz -O /tmp/dotfiles.tar.gz

# uncompress the archive
tar -xf /tmp/dotfiles.tar.gz -C /tmp
mkdir $HOME/.dotfiles
mv /tmp/dotfiles-master/* $HOME/.dotfiles
rm -r /tmp/dotfiles.tar.gz /tmp/dotfiles-master

# install dotfiles
cd $HOME/.dotfiles
sh ./install.sh

# init dotfiles git repo (it's basically a git clone)
git init -b master
git remote add origin https://github.com/AnatoleLucet/dotfiles.git
git fetch
git branch master origin/master
git reset --hard HEAD
git remote remove origin
git remote add origin git@github.com:AnatoleLucet/dotfiles.git

cd -
