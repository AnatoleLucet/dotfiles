
# Vars
# ----------

RED=\033[0;31m
NC=\033[0m


# Install
# ----------

install:
	# update apt & apt-get
	echo "${RED} update apt & apt-get ${NC}"
	sudo apt-get update
	sudo apt update

	# install curl
	echo "${RED} install curl ${NC}"
	sudo apt-get install curl -y

	# install i3wm
	echo "${RED} install i3wm ${NC}"
	sudo apt-get install i3 -y
	sudo apt-get install i3status -y

	# install dmenu 
	echo "${RED} install snap ${NC}"
	sudo apt-get install dmenu -y

	# install snap
	echo "${RED} install snap ${NC}"
	sudo apt install snapd -y
	
	# install zsh & ho my zsh
	echo "${RED} install zsh & ho my zsh ${NC}"
	sudo apt-get install zsh -y
	chsh -s $$(which zsh)
	sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
	
	# install powerline
	echo "${RED} install powerline ${NC}"
	sudo apt-get install fonts-powerline -y

	# install lsd
	echo "${RED} install lsd ${NC}"
	sudo snap install lsd --classic
	
	# install htop
	echo "${RED} install htop ${NC}"
	sudo apt-get install htop -y

	# install vscode
	echo "${RED} install vscode ${NC}"
	sudo snap install code --classic

	# install google chrome
	echo "${RED} install google chrome ${NC}"
	sudo sh -c ' echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install google-chrome-stable -y

	# install pulseaudio
	echo "${RED} install pulseaudio ${NC}"
	sudo apt update
	sudo apt install pulseaudio -y
	sudo apt install pavucontrol -y

	# install docker
	echo "${RED} install docker ${NC}"
	sudo snap install docker --classic
	sudo groupadd docker
	sudo usermod -aG docker $(USER)

	# install docker-compose
	echo "${RED} install docker-compose ${NC}"
	sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

	# install node & npm
	echo "${RED} install node & npm ${NC}"
	sudo apt-get update
	sudo apt-get install nodejs npm -y

	# install yarn
	echo "${RED} install yarn ${NC}"
	sudo npm -g i yarn
	
	# install neovim
	echo "${RED} install neovim ${NC}"
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get install neovim
	# deps for neovim
	sudo apt-get install python-dev python-pip python3-dev python3-pip

	# install tmux
	echo "${RED} install tmux ${NC}"
	sudo apt-get install tmux -y

	# setting up scripts
	echo "${RED} setting up scripts ${NC}"
	sudo sh -c "cp scripts/docker-prune.sh /; chmod +x /docker-prune.sh"

	# open zsh at the end
	zsh


# Others
# ----------

ssh:
	echo "${RED} ssh ${NC}"
	ssh-keygen
	cat ~/.ssh/id_rsa.pub


config/all:
	echo "${RED} config ${NC}"
	make config/git/import
	make config/code/import
	make config/i3/import
	make config/zsh/import
	make config/nvim/import
	make config/tmux/import


# Configs
# ----------

# Git
config/git/import:
	echo "${RED} Importing the git config ${NC}"
	git config --global user.email "lucet.anatole@gmail.com"
	git config --global user.name "AnatoleLucet"
	git config --global core.editor nvim

# Code
config/code/export:
	echo "${RED} Exporting the vscode config ${NC}"
	code --list-extensions | xargs -L 1 echo code --install-extension > code/list-extensions.sh
	cp -rt  code/ ~/.config/Code/User/settings.json ~/.config/Code/User/keybindings.json ~/.config/Code/User/snippets

config/code/import:
	echo "${RED} Importing the vscode config ${NC}"
	sh code/list-extensions.sh
	cp -rt ~/.config/Code/User/ code/settings.json code/keybindings.json code/snippets

# I3
config/i3/export:
	echo "${RED} Exporting the i3 config ${NC}"
	cp -f ~/.config/i3/config i3/config

config/i3/import:
	echo "${RED} Importing the i3 config ${NC}"
	mkdir -p ~/.config/i3
	cp -f i3/config ~/.config/i3

# Zsh
config/zsh/export:
	echo "${RED} Exporting the zsh config ${NC}"
	cp -f ~/.zshrc zsh/

config/zsh/import:
	echo "${RED} Importing the zsh config ${NC}"
	# install plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true
	git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || true
	# import config file
	cp -f zsh/.zshrc ~/

# Neovim
config/nvim/export:
	echo "${RED} Exporting the neovim config ${NC}"
	cp -f ~/.config/nvim/init.vim nvim/
	cp -f ~/.config/nvim/coc-settings.json nvim/

config/nvim/import:
	echo "${RED} Importing the neovim config ${NC}"
	mkdir -p ~/.config/nvim
	# install vim-plug
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# import config files
	cp -f nvim/init.vim ~/.config/nvim/
	cp -f nvim/coc-settings.json ~/.config/nvim/
	# install plugins
	nvim +PlugInstall +qall

# Tmux
config/tmux/export:
	echo "${RED} Exporting the tmux config ${NC}"
	cp -f ~/.tmux.conf tmux/

config/tmux/import:
	echo "${RED} Importing the tmux config ${NC}"
	# install tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	# import tmux.conf
	cp -f tmux/.tmux.conf ~/
	# install plugins
	tmux start-server && tmux new-session -d && ~/.tmux/plugins/tpm/scripts/install_plugins.sh && tmux kill-server

