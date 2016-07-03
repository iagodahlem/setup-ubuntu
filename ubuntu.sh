#
# Ubuntu
#
# Configurations, UI and performance tweaks
# --------------------------------------------------------------------

# Always show options menu
gsettings set com.canonical.Unity always-show-menus true

# Show all startup application files
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

# Uses swap when memory is on 90% of capacity
sudo sysctl vm.swappiness=10
sudo echo vm.swappiness=10 >> /etc/sysctl.conf
