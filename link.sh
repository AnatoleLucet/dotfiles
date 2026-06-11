#/bin/sh

set -e

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
    stow -D $folder -t $HOME 2>/dev/null || true

    # remove conflicting files
    stow --simulate $folder -t $HOME 2>&1 \
      | grep "existing target" \
      | sed "s|.*existing target \(.*\) since.*|\1|" \
      | xargs -I{} rm -f "$HOME/{}"

    stow $folder -t $HOME
done
