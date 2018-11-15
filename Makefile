all:
	# update apt & apt-get
	ccred=$(echo -e "update apt & apt-get")
	sudo apt-get update
	sudo apt update

	# git config
	ccred=$(echo -e "git config")
	git config --global user.email "lucet.anatole@gmail.com"
	git config --global user.name "AnatoleLucet"

	# install curl
	ccred=$(echo -e "install curl")
	sudo apt-get install curl

	# install i3wm
	ccred=$(echo -e "install i3")
	sudo apt-get install i3

	# install atom
	ccred=$(echo -e "install atom")
	sudo add-apt-repository ppa:webupd8team/atom
	sudo apt update
	sudo apt install atom

	# install zsh & ho my zsh
	ccred=$(echo -e "install zsh & ho my szh")
	sudo apt-get install zsh
	chsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	
	# install google chrome
	ccred=$(echo -e "install google chrome")
	sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
 	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
 	sudo apt-get update
	sudo apt-get install google-chrome-stable

	# install docker
	ccred=$(echo -e "install docker")
	sudo apt update
	sudo apt install apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	sudo apt update
	sudo apt install docker-ce
	sudo usermod -aG docker $USER

	# install docker-compose
	ccred=$(echo -e "install docker-compose")
	sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

	# generate ssh key
	ccred=$(echo -e "generate sshkey")
	ssh-keygen

ssh:
	cat ~/.ssh/id_rsa.pub
	
config:
	apm install --packages-file atom/atom-packages.list
	cp -f i3/config ~/.config/i3/config
