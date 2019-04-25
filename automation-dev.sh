#!/bin/bash
sudo apt-get update
sudo apt-get remove -y php* nginx* apache* mysql* git*
sudo apt-get purge -y php* nginx* apache* mysql* git*

#sudo apt-get purge -y go* && sudo apt-get remove -y go*

sudo apt-get autoremove

#Install git, apache and nginx
#Modify the default to make nginx work together with apache
sudo apt-get install -y git nginx apache2
sudo sed -i "s/listen 80 default_server;/listen 8080 default_server;/g" /etc/nginx/sites-available/default 
sudo sed -i "s/listen \[\:\:\]\:80 default_server;/listen \[\:\:\]\:8080 default_server;/g" /etc/nginx/sites-available/default

#Install mysql-server
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password P@55w0rd'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password P@55w0rd'
sudo apt-get -y install mysql-server-5.7

#Install php5.6
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get install -y php5.6 php5.6-fpm
sudo apt-get install -y php5.6-mcrypt php5.6-cli php5.6-gd php5.6-curl php5.6-mysql php5.6-redis php5.6-zip gcc

#Install php5.6 falcon
sudo curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | sudo bash
sudo apt-get install -y php5.6-phalcon

sleep 5

#Install go lang
sudo curl -O https://storage.googleapis.com/golang/go1.12.1.linux-amd64.tar.gz
sudo tar -xvf go1.12.1.linux-amd64.tar.gz
sudo mv go /usr/local
sudo touch "/home/ubuntu/.bashrc"
{
    echo "export GOROOT=/usr/local/go"
    echo "export GOPATH=/home/ubuntu/.go"
    echo "export PATH=/home/ubuntu/.go/bin:/usr/local/go/bin:$PATH"
} >> "/home/ubuntu/.bashrc"


#Uncomment this when you launch AMI of ubuntu16.04
#sudo mkdir /var/www/
#sudo mkdir /var/www/html

sudo chown www-data:www-data /var/www/html -R
sudo chown www-data:www-data /var/www/html/* -R

sudo su
echo "127.0.0.1   localhost" >> /etc/hosts

service php5.6-fpm restart
service nginx start
service apache2 restart