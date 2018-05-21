all:
	sudo apt-get update
	sudo apt update

	sudo apt-get install curl

	sudo apt install ubuntu-make
	umake web firefox-dev

	sudo apt-get install i3

	sudo apt update
	sudo apt install atom
	apm install --packages-file atom/atom-packages.list

	sudo apt-get install zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


test:
	sudo apt-get install mysql-server php-mysql
	##sudo mysql_install_db
	sudo /usr/bin/mysql_secure_installation

	sudo apt install nginx

	sudo apt install mariadb-server mariadb-client

	sudo apt-get install php-fpm
