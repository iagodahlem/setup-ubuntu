#!/bin/sh

# Basic Stuff
sudo apt-get install git vim python-software-properties

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

# Set Up Node With NVM
nvm install 5.2.0
nvm use 5.2.0
