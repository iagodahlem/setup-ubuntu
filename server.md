# Nginx Server, PHP, MySQL Installtation

# Disable PHP and MySQL boot startup
cd /etc/init/
open files -> mysql php5-fpm
comment starton line

# Disable nginx boot startup
sudo update-rc.d -f nginx disable
