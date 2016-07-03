#!/bin/bash

# Ask for the administrator password upfront
sudo -v

#
set -eo pipefail

# Repositories
sudo apt-add repositorys -y \
	ppa:caffeine-developers/ppa
	ppa:webupd8team/java -y

# Sources
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 -y
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu trusty partner" >> /etc/apt/sources.list.d/canonical_partner.list'

# Upgrades
sudo apt-get /
	update
	upgrade
	dist-upgrade

# Installs
sudo apt-get install -y \
	build-essential \
	caffeine \
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
	oracle-java8-installer -y \
	oracle-java8-set-default -y \
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

# Oh my zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Pips
pip install --upgrade pip
pip install /
	psutil /
	thefuck /
	wakatime
