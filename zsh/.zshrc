# --- Oh-My-Zsh ---
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
	git
	emoji
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# Start Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh


# --- Defs ---
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.yarn/bin
export GOPATH=$HOME/go

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- Aliases ---

# Lsd 
lsdOptions='--group-dirs first'
alias ls='lsd '$lsdOptions
alias lsa='lsd -a '$lsdOptions
alias la='lsd -la '$lsdOptions
alias ll='lsd -l '$lsdOptions

# Docker
alias d='docker'
alias di='docker images'
alias drmi='docker rmi'
alias dps='docker ps'
alias drm='docker rm'
alias dl='docker pull'
alias dp='docker push'
alias ds='docker stop'

# Docker compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias dcs='docker-compose stop'
alias dcd='docker-compose down'
alias dcb='docker-compose build'

# Bazel
alias b='bazel'
alias bb='bazel build'
alias br='bazel run'
alias bt='bazel test'
alias byarn='bazel run @nodejs//:yarn'
alias bnpm='bazel run @nodejs//:npm'
bnode() { bazel run @nodejs//:"$@"; }

# Yarn
alias y='yarn'
alias yi='yarn init'
alias ya='yarn add'
alias yr='yarn remove'

# Make
alias m='make'
alias ma='make all'
alias mr='make run'

# Nvim
alias nv='nvim'

# Tree
alias t='tree --dirsfirst'

# St
alias stlight='xrdb -merge ~/st/.Xlighttheme && xrdb -edit ~/.Xresources'
alias stdark='xrdb -merge ~/st/.Xresources && xrdb -edit ~/.Xresources'

# Others
alias open='xdg-open'
mc() { mkdir "$@" && cd "$@"; }
