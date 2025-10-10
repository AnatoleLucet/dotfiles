#!/bin/sh

set -e

sudo true


installdir=$HOME/.dotfiles
tmpfolder=$(mktemp -d /tmp/dotfiles.XXXXX)

# download repo
wget https://github.com/AnatoleLucet/dotfiles/archive/master.tar.gz -O $tmpfolder/dotfiles.tar.gz

# uncompress the archive
tar -xf $tmpfolder/dotfiles.tar.gz -C $tmpfolder

# setup temporary dotfiles in install dir
if [ -d "$installdir" ]; then
  read -p "'$installdir' already exists. Remove it? (y/n): " yn
  case $yn in
    [Yy]* ) rm -rf "$installdir";;
    [Nn]* ) echo "Unable to install dotfiles."; exit 1;;
    * ) echo "Please answer y or n.";;
  esac
fi
cp -r $tmpfolder/dotfiles-master $installdir

# install dotfiles
cd $installdir
sh ./install.sh

# clone dotfiles at install dir
rm -rf $installdir
git clone https://github.com/AnatoleLucet/dotfiles.git $installdir
cd $installdir
git remote remove origin
git remote add origin git@github.com:AnatoleLucet/dotfiles.git
