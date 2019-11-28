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


# --- Aliases ---

# Lsd 
alias ls='lsd'
alias lsa='lsd -a'
alias la='lsd -la'
alias ll='lsd -l'

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
alias byarn='bazel @nodejs//:yarn'
alias bnpm='bazel @nodejs//:npm'

# Yarn
alias y='yarn'
alias yi='yarn init'
alias ya='yarn add'
alias yr='yarn remove'

# Nvim
alias nv='nvim'
