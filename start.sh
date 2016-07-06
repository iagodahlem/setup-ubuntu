#!/bin/sh

ARROW="→"
CHECK="✔"

function msg() {
	echo "\033[1;37m$1\033[0m";
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

msg 'SETUP => STEP 1'

# Upgrade
msg_run 'update' 'apt-get update'
sudo apt-get update &> /dev/null
msg_ok 'update'

msg_run 'upgrade' 'apt-get upgrade'
sudo apt-get upgrade -y &> /dev/null
msg_ok 'upgrade'

msg_run 'dist-upgrade' 'apt-get dist-upgrade'
sudo apt-get dist-upgrade -y &> /dev/null
msg_ok 'dist-upgrade'

# ZSH
if ! which zsh &> /dev/null; then
	sudo apt-get install &> /dev/null zsh
	chsh -s $(which zsh)
	msg_ok 'zsh installed'
else
	msg_done 'zsh already installed'
fi

msg ''
msg 'SETUP => STEP 1 DONE'
msg ''
msg_done 'Log out and login back again to use your new default shell...'
