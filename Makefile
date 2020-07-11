RED=\033[0;31m
NC=\033[0m
ROOT_DIR=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all:
	make install
	make c/i/all
	make ssh

	# keep at the end
	zsh

install:
	echo "${RED} install deps ${NC}"

	# - update apt -
		sudo apt update

	# - requirements -
		sudo apt install -y \
			curl \
			wget

	# - apt repos -
		# neovim
		sudo add-apt-repository -y ppa:neovim-ppa/unstable

		@if !(grep -q Microsoft /proc/version); then \
			`# google chrome` \
			sudo sh -c ' echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'; \
			wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -; \
		\
			`# gyazo` \
			curl -s https://packagecloud.io/install/repositories/gyazo/gyazo-for-linux/script.deb.sh | sudo bash; \
		fi


	# - update apt -
		sudo apt update

	# - apt deps -
		sudo apt install -y \
			xserver-xorg-core xserver-xorg xorg openbox \
			fontconfig libfreetype6-dev ubuntu-desktop libxft-dev libx11-dev \
			pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev \
			libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev autoreconf xss-lock \
			libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev \
			zsh \
			fonts-powerline \
			htop \
			nodejs npm \
			golang \
			neovim \
			python-dev python3-dev python3-pip \
			tmux \
			feh \
			tree \
			redshift-gtk \
			pulseaudio \
			pavucontrol \
			pasystray
		
		@if !(grep -q Microsoft /proc/version); then \
			sudo apt install -y \
				snapd \
				i3 i3status \
				dmenu \
				google-chrome-stable \
				gyazo \
		;fi

	# - snap deps -
		@if !(grep -q Microsoft /proc/version); then \
			sudo snap install --classic lsd; \
			sudo snap install --classic docker; \
			sudo snap install --classic code; \
		fi

	# - npm deps -
		sudo npm -g install \
			yarn

	# - manually install -
		# oh-my-zsh
		rm -rf ~/.oh-my-zsh
		sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

		@if grep -q Microsoft /proc/version; then \
			`#snapd` \
			sudo dpkg -i ./lsd/lsd-musl_0.17.0_amd64.deb; \
		fi

		@if !(grep -q Microsoft /proc/version); then \
			`# docker-compose` \
			sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose; \
			sudo chmod +x /usr/local/bin/docker-compose; \
			\
			`# st` \
			cp -r ./st ~/; \
			cd ~/st && sudo make install; \
			 \
			`# xcwd` \
			git clone https://github.com/schischi/xcwd.git ~/xcwd; \
			cd ~/xcwd && sudo make install; \
		fi

		# i3lock-color
		git clone https://github.com/Raymo111/i3lock-color.git ~/i3lock-color
		sh ~/i3lock-color/build.sh

		# betterlockscreen
		curl https://raw.githubusercontent.com/UtkarshVerma/installer-scripts/master/betterlockscreen.sh | sh -
		betterlockscreen -u ${ROOT_DIR}/.img/wallpaper.jpg

	# - others -
		# zsh as default shell
		chsh -s $$(which zsh)

		@if !(grep -q Microsoft /proc/version); then \
			`# docker perms` \
			sudo groupadd docker; \
			sudo usermod -aG docker $(USER); \
		fi


ssh:
	echo "${RED} generating an ssh key ${NC}"

	ssh-keygen
	cat ~/.ssh/id_rsa.pub


c/i/all:
	echo "${RED} importing all ${NC}"

	make c/i/git
	make c/i/zsh
	make c/i/nvim
	make c/i/tmux

	@if !(grep -q Microsoft /proc/version); then \
		make c/i/i3; \
		make c/i/st; \
		make c/i/code; \
	fi

# git conf
c/i/git:
	git config --global user.email "lucet.anatole@gmail.com"
	git config --global user.name "AnatoleLucet"
	git config --global core.editor nvim

# vscode conf
c/e/code:
	code --list-extensions | xargs -L 1 echo code --install-extension > code/list-extensions.sh

c/i/code:
	sh code/list-extensions.sh

	rm -rf ~/.config/Code/User/snippets
	ln -sf ${ROOT_DIR}/code/* ~/.config/Code/User

# i3
c/i/i3:
	mkdir -p ~/.config/i3 || true
	ln -sf ${ROOT_DIR}/i3/* ~/.config/i3	
	ln -sf ${ROOT_DIR}/.img/wallpaper.jpg ~/.config/i3

# zsh
c/i/zsh:
	# install plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true
	git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || true
	# symlink
	ln -sf ${ROOT_DIR}/zsh/.zshrc ~/

# neovim
c/i/nvim:
	mkdir -p ~/.config/nvim
	# install vim-plug
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# import config files
	ln -sf ${ROOT_DIR}/nvim/* ~/.config/nvim
	# install plugins
	nvim +PlugInstall +qall

# tmux
c/e/tmux:
	cp -f ~/.tmux.conf tmux/

c/i/tmux:
	# install tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	# import tmux.conf
	ln -sf ${ROOT_DIR}/tmux/.tmux.conf ~/
	# install plugins
	# TODO fix: "unknown variable: TMUX_PLUGIN_MANAGER_PATH FATAL: Tmux Plugin Manager not configured in tmux.conf"
	tmux start-server && tmux new-session -d && ~/.tmux/plugins/tpm/scripts/install_plugins.sh && tmux kill-server || true

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

# xorg
c/i/xorg:
	mkdir /etc/X11/xorg.conf.d || true
	sudo ln -sf ${ROOT_DIR}/xorg/* /etc/X11/xorg.conf.d
