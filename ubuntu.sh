#!/bin/sh

#
# Ubuntu
#
# Configurations, UI and performance tweaks
# --------------------------------------------------------------------

gsettings set com.canonical.Unity always-show-menus true
msg_ok "Always show options menu"

sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
msg_ok "Show all startup application files"

sudo sysctl vm.swappiness=10 &> /dev/null
msg_ok "Uses swap only when memory is on 90% of capacity"

msg ""
