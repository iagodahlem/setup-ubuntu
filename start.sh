#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Tells the shell script to exit if it encounters an error
set -e

ARROW="→"
CHECK="✔"

function msg() {
	echo "\033[0;37m$1\033[0m";
}

function msg_bold() {
	echo "\033[1;34m$1\033[0m";
}

function msg_ok() {
	echo "$ARROW\033[1;32m  $1 $CHECK\033[0m";
}

function msg_run() {
	echo "$ARROW\033[1;35m  $1 $ $2\033[0m";
}

function msg_done() {
	echo "$ARROW\033[1;37m  $1 \033[0m";
}

msg ""
msg_bold "    _____      _ "
msg_bold "   / ____|    | | "
msg_bold "  | (___   ___| |_ _   _ _ __ "
msg_bold "   \___ \ / _ \ __| | | | '_ \ "
msg_bold "   ____) |  __/ |_| |_| | |_) | "
msg_bold "  |_____/ \___|\__|\__,_| .__/ "
msg_bold "                       | | "
msg_bold "                       |_| "
msg ""
msg "   \e[3mMade by @iagodahlem with \033[1;31m♥\033[0m "
msg ""
msg " ------------------------------- "
msg ""
msg " This is only the beginning... "
msg " After this complete, you should logout and login back again,"
msg " then run \033[1;32m$ source ./setup.sh\033[0m to all magic happen."
msg ""

# Upgrade
sudo apt-get update &> /dev/null
msg_ok "update"

sudo apt-get upgrade -y &> /dev/null
msg_ok "upgrade"

sudo apt-get dist-upgrade -y &> /dev/null
msg_ok "dist-upgrade"

# Git
if ! [[ -x "$(command -v git)" ]]; then
	sudo apt-get install -y \
		git \
		git-core
fi
msg_ok "git"

# ZSH
if ! which zsh &> /dev/null; then
	msg_run "zsh" "apt-get install"
	sudo apt-get install &> /dev/null zsh
	chsh -s $(which zsh)
fi
msg_ok "zsh"

# Setup
if ! [[ -d "$HOME/.dotfiles" ]]; then
	git clone https://github.com/iagodahlem/setup.git $HOME/.setup
fi
msg_ok "setup"

msg ""
msg_ok "Finished"
msg ""
msg " Log out and login back again to use your new default shell..."
msg ""
