#!/bin/sh

set -e

export SCRIPT_PATH=$(dirname $(realpath -s $0))

# TODO: refactor root perms
sudo true

# install nixpkgs
wget https://nixos.org/nix/install -O - | sh
. $HOME/.nix-profile/etc/profile.d/nix.sh
sudo sed -i "s~\(secure_path=\)\([\"']\)\(.*\)[\"']~\1\2\3\:$HOME/.nix-profile/bin\2~g" /etc/sudoers

# install home-manger
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

# install nixGL
nix-channel --add https://github.com/guibou/nixGL/archive/master.tar.gz nixgl
nix-channel --update
nix-env -iA nixgl.nixGLDefault

# install dotfiles
rm -rf $HOME/.config/nixpkgs
ln -sf $SCRIPT_PATH/nixpkgs $HOME/.config
home-manager switch

# install nvim plugins
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall 2> /dev/null
npm config set prefix '~/.npm-packages'
sudo npm i -g @fsouza/prettierd

if lsb_release -d | grep -q "Ubuntu"; then
	sudo apt update

	# install i3-gaps
	sudo add-apt-repository -y ppa:kgilmer/speed-ricer
	sudo apt install -y i3-gaps 

	# install docker
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo \
		"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io
	sudo groupadd docker
	sudo usermod -aG docker $USER

	# install tlp
	sudo apt install -y tlp
else 
	echo "[WARN] Unsupported linux distro. You need to install docker, i3-gaps and tlp manually."
fi

# set zsh as the default shell
which zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)
sudo usermod -s $(which zsh) $USER
