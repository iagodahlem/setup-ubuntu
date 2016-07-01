#!/bin/bash

# Default variables
readonly PREFIX_ICON="→"

# Ask for the administrator password upfront
sudo -v
set -eo pipefail

sudo apt-get update
sudo apt-get install -y \
	ubuntu-restricted-extras \
	xsel \
	htop \
	zsh \
	curl \
	smbclient \
	vlc browser-plugin-vlc \
	meld \
	git git-core \
	openssh-server
