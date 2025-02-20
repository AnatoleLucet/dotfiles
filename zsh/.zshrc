# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(
	git
	emoji
	zsh-syntax-highlighting
	zsh-autosuggestions
	fzf-tab
  bazel
  extract
  git
  emoji
  docker
  gitfast
  golang
  grc
  kubectl
  thefuck
)
source $ZSH/oh-my-zsh.sh

# GRC
[ -s "$HOME/.nix-profile/etc/grc.zsh" ] && source ~/.nix-profile/etc/grc.zsh

# Bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Cargo
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
f() {
    sels=( '${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}' )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}
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
alias gre='git restore'
alias gres='git restore --source'
alias greS='git restore --staged'
alias gcn!='git commit -v --no-edit --amend'
unalias grh
grh() { git reset HEAD "$@" && gst; }
unalias grhh
grhh() { git reset HEAD --hard "$@" && gst; }
unalias gru
gru() { git reset -- "$@" && gst; }
alias gcm='git checkout $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias fgco='git checkout $(git branch --color=always | fzf --ansi --reverse)'
alias fgr='git revert $(git log --oneline --decorate --color=always | fzf --ansi --reverse)'
alias gsf='g show $(glo | fzf --ansi --reverse | cut -f 1 -d " ")'
code-owners() {
	git ls-files ${@:-.} | parallel -d "\n" 'file {} | ag ":.* text" | sed "s/:.*$//" | xargs git blame --line-porcelain | ag "^author " | sed "s/^author //"' 2> /dev/null  | sort -f | uniq -ic | sort -nr
}
commits-owners() {
	# git log --no-merges | grep Author | sed 's/.*<\(.*\)>/\1/' | sort -f | uniq -ic | sort -nr
  git shortlog -nse
}
author-stats() {
	git log --author="$@" --pretty=tformat: --numstat | gawk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "Added lines: %s\nRemoved lines: %s\nTotal lines: %s\n", add, subs, loc }' -
}

# Others
alias open='xdg-open'
alias sudo='nocorrect sudo '
alias dtf='cd ~/.dotfiles'
# alias bat='batcat'
mcd() { mkdir -p "$@" && cd "$@"; }
p() { ping ${1:-"1.1.1.1"} }
alias fortune='fortune -n 200 | cowsay | lolcat'
alias dv='cd ${$(fd --hidden --type d "^.git$" ~/dev | rev | cut -d "/" -f 3- | rev | fzf --reverse --height=15):-$(pwd)}'
# alias dv='cd ${$(echo $HOME/dev/$(fd --hidden --type d "^.git$" ~/dev | rev | cut -d "/" -f 2- | rev | sed "s/${HOME//\//\\/}\/dev\///g" | fzf --reverse --height=15)):-$(pwd)}'
alias extip='curl https://ipinfo.io/ip; echo'
alias tv='tidy-viewer -n 10000'
e() { nautilus ${@:-.} & }

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
bindkey "^ " autosuggest-accept
bindkey "^k" up-history
bindkey "^j" down-history

# kind of an ungly hack to fix weird freeze issue with gnome inside a vm
if systemd-detect-virt > /dev/null; then
  env LIBGL_ALWAYS_SOFTWARE=1 gnome-session --session=gnome
fi

# eval $(thefuck --alias)
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
