#!/bin/sh

hello

# Installs
sudo apt-get install -y \
	build-essential \
	chromium-browser \
	curl \
	indicator-multiload \
	meld \
	openssh-server \
	preload \
	smbclient \
	ubuntu-restricted-extras \
	unity-tweak-tool \
	vim \
	vlc \
	xclip \
	xsel
msg_ok "build-essential"
msg_ok "chromium-browser"
msg_ok "curl"
msg_ok "htop"
msg_ok "indicator-multiload"
msg_ok "meld"
msg_ok "openssh-server"
msg_ok "preload"
msg_ok "smbclient"
msg_ok "ubuntu-restricted-extras"
msg_ok "unity-tweak-tool"
msg_ok "vim"
msg_ok "vlc"
msg_ok "xclip"
msg_ok "xsel"

# Caffeine
if has_not caffeine; then
	sudo apt-add reposiory -y ppa:caffeine-developers/ppa
	sudo apt-get update
	sudo apt-get install caffeine
fi
msg_ok "caffeine"

# Chrome Stable
if has_not google-chrome-stable; then
	wget -O ~/Downloads/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg --force-depends -i ~/Downloads/chrome.deb
	sudo apt-get install -fy
	rm ~/Downloads/chrome.deb
fi
msg_ok "chrome stable"

# Docker
if has_not docker; then
	sudo apt-get update
	sudo apt-get install apt-transport-https ca-certificates -y
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D -y

	echo deb https://apt.dockerproject.org/repo ubuntu-wily main | sudo tee /etc/apt/sources.list.d/docker.list
	sudo apt-get update
	sudo apt-get purge lxc-docker -y
	apt-cache policy docker-engine
	sudo apt-get install linux-image-extra-$(uname -r) -y
	sudo apt-get update
	sudo apt-get install docker-engine -y
	sudo service docker start
	sudo groupadd docker
	sudo usermod -aG docker iago
fi
msg_ok "docker"

# Gitkraken
if has_not gitkraken; then
	wget -O ~/Downloads/gitkraken.deb https://release.gitkraken.com/linux/gitkraken-amd64.deb
	sudo dpkg --force-depends -i ~/Downloads/gitkraken.deb
	sudo apt-get install -fy
	rm ~/Downloads/gitkraken.deb
fi
msg_ok "gitkraken"

# Java
if has_not_dir "$HOME/.java"; then
	sudo add-apt-repository -y ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
	sudo apt-get install oracle-java8-set-default
fi
msg_ok "java 8"

# Maven
if has_not mvn; then
	sudo apt-get install maven
fi
msg_ok "maven"

# Mutate
if has_not mutate; then
	# Dependencies
	sudo apt-get install -y \
		qt5-qmake \
		qt5-default \
		libgtk2.0-dev \
		libqt5x11extras5-dev \
		libboost-regex-dev

	# Mutate
	git clone https://github.com/qdore/Mutate.git ~/.softwares/Mutate
	cd ~/.softwares/Mutate/src
	qmake
	make

	sudo make install
	cd ..
	sudo cp info/mutate.png /usr/share/icons
	sudo cp info/Mutate.desktop /usr/share/applications
	mkdir -p ~/.config/Mutate
	cp -R config/* ~/.config/Mutate
	chmod -R a+x ~/.config/Mutate/scripts
	chmod -R a+w ~/.config/Mutate
	sed -i "s|{home}|$HOME|g" ~/.config/Mutate/config.ini

	cd ~
fi
msg_ok "mutate"

# NVM
if has_not_dir "$HOME/.nvm"; then
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
	source ~/.zshrc
	nvm install node
	nvm use node
	nvm alias default node

	npm i -g \
		npm \
		babel \
		bower \
		browserify \
		csscomb \
		empty-trash-cli \
		eslint \
		grunt-cli \
		gulp-cli \
		stylelint \
		trash-cli \
		webpack \
		yo
fi
msg_ok "nvm, npm modules"

# Oh My ZSH
if has_not_dir "$HOME/.oh-my-zsh"; then
	chsh -s /usr/bin/zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# Plugins
	git clone https://github.com/wbinglee/zsh-wakatime.git ~/.custom/plugins/zsh-wakatime
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.custom/plugins/zsh-syntax-highlighting

	# Themes
	wget https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme -O ~/.custom/themes/dracula.zsh-theme
fi
msg_ok "oh-my-zsh"

# Pip
if has_not pip; then
	sudo apt-get install -y \
		python-dev \
		python-pip \
		python-software-properties
	sudo pip install --upgrade \
		pip \
		virtualenv
	sudo pip install \
		psutil \
		thefuck \
		wakatime
fi
msg_ok "pip"

# Redshift
if has_not redshift; then
	sudo apt-get install -y \
		redshift \
		redshift-gtk
fi
msg_ok "redshift"

# Rescuetime
if has_not rescuetime; then
	wget -O ~/Downloads/rescuetime.deb https://www.rescuetime.com/installers/rescuetime_current_amd64.deb
	sudo dpkg --force-depends -i ~/Downloads/rescuetime.deb
	sudo apt-get install -fy
	rm ~/Downloads/rescuetime.deb
fi
msg_ok "slack"

# Skype
if has_not skype; then
	sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list.d/canonical_partner.list'
	sudo apt-get update
	sudo apt-get install -y skype
fi
msg_ok "skype"

# Slack
if has_not slack; then
	wget -O ~/Downloads/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-2.1.0-amd64.deb
	sudo dpkg --force-depends -i ~/Downloads/slack.deb
	sudo apt-get install -fy
	rm ~/Downloads/slack.deb
fi
msg_ok "slack"

# Spotify
if has_not spotify; then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 -y
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client -y --allow-unauthenticated
fi
msg_ok "spotify"

# Sublime Text
if has_not subl; then
	sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
	sudo apt-get update
	sudo apt-get -y install sublime-text-installer
fi
msg_ok "sublime"

# Tlp
if has_not tlp; then
	sudo apt-get remove laptop-mode-tools -y
	sudo add-apt-repository ppa:linrunner/tlp -y
	sudo apt-get update
	sudo apt-get install tlp tlp-rdw -y
	sudo tlp start
fi
msg_ok "tlp"

if has_not vagrant; then
	wget -O ~/Downloads/vagrant.deb https://releases.hashicorp.com/vagrant/1.8.4/vagrant_1.8.4_x86_64.deb
	sudo dpkg --force-depends -i ~/Downloads/vagrant.deb
	sudo apt-get install -fy
	rm ~/Downloads/vagrant.deb
fi
msg_ok "vagrant"

# Virtualbox
if has_not virtualbox; then
	sudo apt-get install -y \
		virtualbox \
		virtualbox-dkms
fi
msg_ok "virtualbox"

# Cleanup
sudo apt-get autoclean &> /dev/null -y
sudo apt-get autoremove &> /dev/null -y

source ~/.zshrc

msg ""
