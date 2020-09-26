#!/usr/bin/env bash
sudo service nginx stop

# Apache
apt-get install -y apache2

# Enable Apache Mods
a2enmod rewrite

#Add Onrej PPA Repo
apt-add-repository ppa:ondrej/php
sudo apt-get update

# Install PHP
sudo apt install -y php7.2 
sudo apt install -y libapache2-mod-php7.2 
sudo apt install -y php7.2-common 
sudo apt install -y php7.2-mbstring 
sudo apt install -y php7.2-xmlrpc 
sudo apt install -y php7.2-soap 
sudo apt install -y php7.2-gd 
sudo apt install -y php7.2-xml 
sudo apt install -y php7.2-intl 
sudo apt install -y php7.2-mysql 
sudo apt install -y php7.2-cli 
sudo apt install -y php7.2-zip 
sudo apt install -y php7.2-curl
sudo apt install -y php7.2-dev
sudo apt install -y php-pear

sudo apt-get -y install gcc make autoconf libc-dev pkg-config
sudo apt-get -y install libmcrypt-dev
sudo pecl install mcrypt-1.0.1
sudo bash -c "echo extension=/usr/lib/php/20170718/mcrypt.so > /etc/php/7.2/cli/conf.d/mcrypt.ini"
sudo bash -c "echo extension=/usr/lib/php/20170718/mcrypt.so > /etc/php/7.2/apache2/conf.d/mcrypt.ini"
php -i | grep mcrypt

sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Restart Apache
sudo service apache2 restart
