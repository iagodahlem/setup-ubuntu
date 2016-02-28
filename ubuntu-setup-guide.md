# Ubuntu Setup Guide

TODO: Description

## 1. Updating Everything

```sh
sudo apt-get update

sudo apt-get upgrade

sudo apt-get dist-upgrade
```

## 2. ZSH - Oh-My-Zsh

```sh
sudo apt-get install zsh

zsh --version

chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

> Than you need to logout to make changes.

## 3. Install Softwares

```sh
sudo apt-get install git vim python-software-properties

sudo apt-get install chromium-browser

sudo apt-get install vlc
```

### Softwares that need be downloaded and installed manually

#### Browser

* [Google Chrome Stable](https://www.google.com.br/chrome/browser/desktop/)

#### Development

* [Sublime Text](https://www.sublimetext.com/)
* [GitKraken](http://www.gitkraken.com/)
* [VirtualBox](https://www.virtualbox.org/)
* [Slack](https://slack.com/)
* [Mysql Workbench](https://www.mysql.com/products/workbench/)

#### Other

* [Skype](http://www.skype.com/)
* [DropBox](http://www.skype.com/pt-br/)

### Installed by Software Center

* [ReText](https://sourceforge.net/projects/retext/)
* [Unity Tweak Tool](https://apps.ubuntu.com/cat/applications/unity-tweak-tool/)

## 4. NVM

```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

nvm install NODE_VERSION

nvm use NODE_VERSION
```

## 5. Java JDK/JRE 8 - Eclipse IDE

### Java

```sh
sudo add-apt-repository ppa:webupd8team/java

sudo apt-get install oracle-java8-installer

sudo apt-get install oracle-java8-set-default
```

### Eclipse IDE Installation

First download eclipse.tar.gz in [Eclipse site](TODO: URL).

```sh
sudo tar -zxvf eclipse.tar.gz -C /opt/

sudo gedit /usr/share/applications/eclipse.desktop
```

Than paste this on the recent archive:

```
[Desktop Entry]
Name=Eclipse 4
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse
```

> To remove Eclipse

```sh
sudo rm -Rf /opt/eclipse/

sudo rm -Rf /usr/share/applications/eclipse.desktop
```

## 6. TLP (Do battery during more)

```sh
sudo apt-get remove laptop-mode-tools
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
sudo tlp start
```

## 7. Generating SSH Key for Github

Creates a new ssh key, using the provided email as a label
```sh
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Start the ssh-agent in the background
```sh
eval "$(ssh-agent -s)"
```

Add your SSH key to the ssh-agent
```sh
ssh-add ~/.ssh/id_rsa
```

Copy the SSH key to your clipboard.
```sh
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Add the SSH Key on Github Account

Test your Connection
```sh
ssh -T git@github.com
```

> List existing SSH Keys
```sh
ls -al ~/.ssh
```

## 8. Always Show Options Menu

```sh
gsettings set com.canonical.Unity always-show-menus true
```

> To remove
```sh
gsettings set com.canonical.Unity always-show-menus false
```

## 9. Ubuntu Plugins

### System Load Indicator

```sh
sudo apt-get install indicator-multiload
```

### Preload

```sh
sudo apt-get install preload
```

### Caffeine

```sh
sudo apt-add-repository ppa:caffeine-developers/ppa

sudo apt-get update

sudo apt-get install caffeine
```

## 10. Perfomance Configs

### Show all boot files

```sh
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
```

### Removes Swap Percentual

```sh
sudo sysctl vm.swappiness=10

sudo gedit /etc/sysctl.conf

Colar esta linha no final do arquivo
vm.swappiness=10
```
