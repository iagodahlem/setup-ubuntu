#!/bin/sh

# Ask for the administrator password upfront
sudo -v

source ./utils.sh

source ./install.sh
source ./ubuntu.sh

msg_ok "Installation finished..."
msg ""
