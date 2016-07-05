#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Tells the shell script to exit if it encounters an error
set -e

# Sources
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 -y
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list.d/canonical_partner.list'
ok "sources"

# Upgrades
sudo apt-get \
	update \
	upgrade -y \
	dist-upgrade -y \
ok "upgrades"

# Installs
sudo apt-get install -y \
	build-essential \
	chromium-browser \
	curl \
	git \
	git-core \
	htop \
	indicator-multiload \
	libboost-regex-dev \
	libgtk2.0-dev \
	libqt5x11extras5-dev \
	meld \
	openssh-server \
	preload \
	python-dev \
	python-pip \
	python-software-properties \
	qt5-default \
	qt5-qmake \
	skype \
	smbclient \
	spotify-client \
	ubuntu-restricted-extras \
	unity-tweak-tool \
	vim \
	virtualbox \
	virtualbox-dkms \
	vlc browser-plugin-vlc \
	xsel \
	zsh

msg_ok "build-essential"
msg_ok "chromium-browser"
msg_ok "curl"
msg_ok "git"
msg_ok "git-core"
msg_ok "htop"
msg_ok "indicator-multiload"
msg_ok "libboost-regex-dev"
msg_ok "libgtk2.0-dev"
msg_ok "libqt5x11extras5-dev"
msg_ok "meld"
msg_ok "openssh-server"
msg_ok "preload"
msg_ok "python-dev"
msg_ok "python-pip"
msg_ok "python-software-properties"
msg_ok "qt5-default"
msg_ok "qt5-qmake"
msg_ok "skype"
msg_ok "smbclient"
msg_ok "spotify-client"
msg_ok "ubuntu-restricted-extras"
msg_ok "unity-tweak-tool"
msg_ok "vim"
msg_ok "virtualbox"
msg_ok "virtualbox-dkms"
msg_ok "vlc browser-plugin-vlc"
msg_ok "xsel"
msg_ok "zsh"

# -- Caffeine ------------
if has_not caffeine; then
	sudo apt-add reposiory -y ppa:caffeine-developers/ppa
	sudo apt-get update
	sudo apt-get install caffeine
fi
msg_ok "caffeine"

# -- Oh My ZSH ------------
if ! [[ -d "$HOME/.oh-my-zsh" ]]; then
	chsh -s /usr/bin/zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
msg_ok "oh-my-zsh"

# -- Chrome Stable ------------
if has_not google-chrome-stable; then
	wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg --force-depends -i chrome.deb
	sudo apt-get install -fy
	rm chrome.deb
fi
msg_ok "google-chrome-stable"

# -- Skype ------------
if has_not skype; then
	wget -O skype.deb http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
	sudo dpkg -i skype.deb --ignore-depends
	sudo apt-get install -fy
	rm -rf skype.deb
fi
msg_ok "skype"

# -- Nvm ------------
if ! [[ -d "$HOME/.nvm" ]]; then
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
	source ~/.bashrc
	nvm install node
	nvm use node
	nvm alias default node
fi
msg_ok "nvm"

# -- Java ------------
if which java &> /dev/null; then
	sudo add-apt-repository -y ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
	sudo apt-get install oracle-java8-set-default
fi
msg_ok "java8"

# -- Pip ------------
sudo pip install --upgrade \
	pip \
	virtualenv \
sudo pip install \
	psutil \
	thefuck \
	wakatime
msg_ok "pip"

# -- Spotify ------------
if has_not spotify; then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 -y
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client -y --allow-unauthenticated
fi
msg_ok "spotify"

# -- Tlp ------------
if has_not tlp; then
	sudo apt-get remove laptop-mode-tools -y
	sudo add-apt-repository ppa:linrunner/tlp -y
	sudo apt-get update
	sudo apt-get install tlp tlp-rdw -y
	sudo tlp start
fi
msg_ok "tlp"

cd ~/.custom/plugins && git clone https://github.com/wbinglee/zsh-wakatime.git && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && cd ~/

# -- Cleanup ------------
sudo apt-get autoclean -y
sudo apt-get autoremove -y
msg_ok "cleanup"
