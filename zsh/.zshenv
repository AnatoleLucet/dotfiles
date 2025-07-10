export EDITOR="nvim"
export DENO_INSTALL="$HOME/.deno"
export BUN_INSTALL="$HOME/.bun"
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.yarn/bin:/usr/bin/watchman:/home/linuxbrew/.linuxbrew/bin:$HOME/.cargo/bin:$DENO_INSTALL/bin:$HOME/.local/bin:$BUN_INSTALL/bin
export TERM=xterm-256color # to fix some issues with termbox
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export ANDROID_SDK=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

if [ -x "$(command -v ruby)" ]; then
  export PATH=$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin
fi

[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
