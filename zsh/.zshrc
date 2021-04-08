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
export EDITOR="nvim"
export DENO_INSTALL="/home/anatole/.deno"
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.yarn/bin:/usr/bin/watchman:/home/linuxbrew/.linuxbrew/bin:$HOME/.cargo/bin:$DENO_INSTALL/bin
export TERM=xterm-256color # to fix some issues with termbox
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# --- fzf ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
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
alias t='tree --dirsfirst -C'

# Git
alias gcm='git checkout $(git symbolic-ref --short HEAD)'
alias fgco='git checkout $(git branch --color=always | fzf --ansi --reverse)'
alias fgr='git revert $(git log --oneline --decorate --color=always | fzf --ansi --reverse)'

# Others
alias open='xdg-open'
alias sudo='nocorrect sudo '
alias dtf='cd ~/.dotfiles'
alias bat='batcat'
alias fd='fdfind'
mcd() { mkdir -p "$@" && cd "$@"; }
p() { ping ${1:-"1.1.1.1"} }
alias fortune='fortune -n 200 | cowsay | lolcat'
alias dv='cd ${$(fd --hidden --type d .git ~/dev | rev | cut -d "/" -f 2- | rev | fzf --reverse):-$(pwd)}'

nmcli() {
    if [[ $@ == "n r" ]]; then
        command nmcli n off && nmcli n on
    else
        command nmcli "$@"
    fi
}

fssh() {
    file="$HOME/ssh-hosts"
    key=$(cat $file | cut -f 1 -d "=" | fzf)

		printf -v formatted_key "%q" $key
		command=$(cat $file | grep $formatted_key | cut -f 2- -d "=" )

    eval $command
}

codi() {
  local syntax="${1:-typescript}"
  shift
  nvim -c \
    "set bt=nofile showtabline=0 |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
		let g:workspace_session_name='' |\
		let g:dashboard_disable_at_vimenter = 1 |\
		cd ~ |\
    Codi $syntax" "$@"
}

bindkey -s '^p' 'dv^M'

eval $(thefuck --alias)
