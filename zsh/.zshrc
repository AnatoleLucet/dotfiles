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
	zsh-vim-mode
)

# Start Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh


# --- Defs ---
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.yarn/bin:/usr/bin/watchman
export GOPATH=$HOME/go

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

MODE_CURSOR_VIINS="blinking bar"

# --- fzf ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias dv='cd $(fd --max-depth 3 . ~/dev | fzf)'
f() {
    sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}
# Deps
alias fz="fzf-noempty --bind 'tab:toggle,shift-tab:toggle+beginning-of-line+kill-line,ctrl-j:toggle+beginning-of-line+kill-line,ctrl-t:top' --color=light -1 -m"
fzf-noempty () {
	local in="$(</dev/stdin)"
	test -z "$in" && (
		exit 130
	) || {
		ec "$in" | fzf "$@"
	}
}
ec () {
	if [[ -n $ZSH_VERSION ]]
	then
		print -r -- "$@"
	else
		echo -E -- "$@"
	fi
}

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
alias dia='docker images -a'
alias drmi='docker rmi'
alias dps='docker ps'
alias drm='docker rm'
alias dl='docker pull'
alias dp='docker push'
alias ds='docker stop'
alias db='docker build'
alias dr='docker run'

# Docker compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias dcs='docker-compose stop'
alias dcd='docker-compose down'
alias dcrm='docker-compose rm'
alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcr='docker-compose run'
alias dcl='docker-compose logs'

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
alias yad='yarn add -D'
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

# Git
alias gcm='git checkout $(git symbolic-ref --short HEAD)'

# Others
alias open='xdg-open'
alias sudo='nocorrect sudo '
alias dtf='cd ~/.dotfiles'
alias bat='batcat'
alias fd='fdfind'
mc() { mkdir "$@" && cd "$@"; }
p() { ping ${1:-"1.1.1.1"} }

