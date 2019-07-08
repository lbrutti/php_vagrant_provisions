#!/usr/bin/env bash

add-apt-repository ppa:ondrej/php
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64,arm64,i386,ppc64el] http://mirror.nodesdirect.com/mariadb/repo/10.3/ubuntu xenial main'
apt-get update


apt-get install -y software-properties-common
apt-get install -y php7.2
apt-get install -y php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml
#install Maria db non interactively
export DEBIAN_FRONTEND="noninteractive"
debconf-set-selections <<< "mariadb-server mysql-server/root_password password $PASSWORD"
debconf-set-selections <<< "mariadb-server mysql-server/root_password_again password $PASSWORD" 
apt-get install -y mariadb-server

apt-get install -y apache2

#enable url rewrite module:
sudo a2enmod rewrite

#install lates wp
curl -O http://wordpress.org/latest.zip
unzip latest.zip 
mv wordpress /vagrant
rm latest.zip 

if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/wordpress /var/www
fi