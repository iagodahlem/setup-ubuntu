#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Tells the shell script to exit if it encounters an error
set -e

source ./utils.sh

source ./install.sh
source ./ubuntu.sh

msg_ok "Installation finished..."
msg ""
