#/bin/sh

set -e

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
    stow -D $folder -t $HOME
    stow $folder -t $HOME
done
