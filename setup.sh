#!/usr/bin/env bash

set -e 

sleep 30
sudo su
sudo apt-get update


echo "Setup script intialized..."
echo "Installing essentials..."
sudo apt-get install wget apache2 -y

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_PASSWORD"

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install mysql-server-5.5 mysql-client-5.5 -y
sudo apt-get install php5 libapache2-mod-php5 php5-mysql -y
sudo apt-get install php5 libapache2-mod-php5 php5-pgsql -y

echo "Downloading torrentflux"
wget http://softlayer-sng.dl.sourceforge.net/project/torrentflux/torrentflux/TorrentFlux%202.4/torrentflux_2.4.tar.gz -O /tmp/torrentflux.tar.gz
cd /tmp

tar zxvf torrentflux.tar.gz
mv torrentflux_* torrentflux
sudo rm -rf /var/www/html/*
sudo cp -r /tmp/torrentflux/html/* /var/www/html/

echo "Creating database and running migrations"
sudo mysqladmin create torrentflux --password=$MYSQL_PASSWORD
sudo mysql torrentflux --password=$MYSQL_PASSWORD < /tmp/torrentflux/sql/mysql_torrentflux.sql

# Setting password in config.php
sed -i "s/\$cfg\[\"db_pass\"\].*$/\$cfg[\"db_pass\"] = \"$MYSQL_PASSWORD\";/"  /var/www/html/config.php


sudo service apache2 restart
sudo service apache2 status
sync
sleep 60