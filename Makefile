RED=\033[0;31m
NC=\033[0m


all:
	make install
	make c/i/all
	make ssh

	# keep at the end
	zsh

install:
	echo "${RED} install deps ${NC}"

	# - apt repos -
		# google chrome
		sudo sh -c ' echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

		# neovim
		sudo add-apt-repository ppa:neovim-ppa/unstable

	# - update apt -
		sudo apt update

	# - apt deps -
		sudo apt install -y \
			curl \
			i3 i3status \
			dmenu \
			snapd \
			zsh \
			fonts-powerline \
			htop \
			google-chrome-stable \
			nodejs npm \
			golang \
			neovim \
			python-dev python-pip python3-dev python3-pip \
			tmux \
			feh \
			xserver-xorg-core xserver-xorg xorg openbox \
			libfontconfig2-dev fontconfig libfreetype6-dev fxlrg ubuntu-desktop libxft-dev libx11-dev \
			tree

	# - snap deps -
		sudo snap instal --classic \
			lsd \
			code \
			docker

	# - npm deps -
		sudo npm -g install \
			yarn

	# - manually install -
		# oh-my-zsh
		chsh -s $$(which zsh)
		sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

		# docker-compose
		sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		sudo chmod +x /usr/local/bin/docker-compose

		# st
		cp -r ./st ~/
		cd ~/st
		sudo make install
		cd -1
		
		# xcwd
		git clone https://github.com/schischi/xcwd.git ~/xcwd
		cd ~/xcwd
		sudo make install
		cd -1

	# - others -
		# docker perms
		sudo groupadd docker
		sudo usermod -aG docker $(USER)

ssh:
	echo "${RED} generating an ssh key ${NC}"

	ssh-keygen
	cat ~/.ssh/id_rsa.pub


c/i/all:
	echo "${RED} importing all ${NC}"

	make c/i/git
	make c/i/code
	make c/i/i3
	make c/i/zsh
	make c/i/nvim
	make c/i/tmux
	make c/i/st

c/e/all:
	echo "${RED} exporting all ${NC}"

	make c/e/git
	make c/e/code
	make c/e/i3
	make c/e/zsh
	make c/e/nvim
	make c/e/tmux
	make c/e/st

# git conf
c/i/git:
	git config --global user.email "lucet.anatole@gmail.com"
	git config --global user.name "AnatoleLucet"
	git config --global core.editor nvim

# vscode conf
c/e/code:
	code --list-extensions | xargs -L 1 echo code --install-extension > code/list-extensions.sh
	cp -rt  code/ ~/.config/Code/User/settings.json ~/.config/Code/User/keybindings.json ~/.config/Code/User/snippets

c/i/code:
	sh code/list-extensions.sh
	cp -rt ~/.config/Code/User/ code/settings.json code/keybindings.json code/snippets

# i3
c/e/i3:
	cp -f ~/.config/i3/* ./i3/

c/i/i3:
	mkdir -p ~/.config/i3
	cp -f ./i3/* ~/.config/i3

# zsh
c/e/zsh:
	cp -f ~/.zshrc zsh/

c/i/zsh:
	# install plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true
	git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || true
	# import config file
	cp -f zsh/.zshrc ~/

# neovim
c/e/nvim:
	cp -f ~/.config/nvim/init.vim nvim/
	cp -f ~/.config/nvim/coc-settings.json nvim/

c/i/nvim:
	mkdir -p ~/.config/nvim
	# install vim-plug
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# import config files
	cp -f nvim/init.vim ~/.config/nvim/
	cp -f nvim/coc-settings.json ~/.config/nvim/
	# install plugins
	nvim +PlugInstall +qall

# tmux
c/e/tmux:
	cp -f ~/.tmux.conf tmux/

c/i/tmux:
	# install tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	# import tmux.conf
	cp -f tmux/.tmux.conf ~/
	# install plugins
	tmux start-server && tmux new-session -d && ~/.tmux/plugins/tpm/scripts/install_plugins.sh && tmux kill-server

# st
c/e/st:
	cp -r ~/st ./

c/i/st:
	rm -rf ~/st
	cp -r ./st ~/
	cd ~/st; \
	sudo make install; \
	xrdb -merge .Xresources; \
	xrdb -edit ~/.Xresources

