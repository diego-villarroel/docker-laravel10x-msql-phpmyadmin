#!/bin/sh

clear
echo "Preparando sistema.."
sleep 5
clear
apt-get update; apt-get upgrade -y
clear
echo "Preparando para instalar Nano.."
sleep 5
clear
apt-get install -y sudo nano
clear
echo "Preparando para instalar Apache.."
sleep 5
clear
apt-get install -y apache2
clear
echo "Preparando para instalar MySql.."
sleep 5
clear
apt-get install -y mariadb-server
clear
echo "Preparando para instalar PHP.."
sleep 5
clear 
# apt-get install -y php libapache2-mod-php php-mysql php-gd php-curl php-bcmath php-json php-mbstring php-xml php-tokenizer php-zip
apt update; apt upgrade;
clear
apt install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
clear
apt install wget
clear 	
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
clear
wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
clear
apt update; apt upgrade -y;
clear 
apt install php8.2 php8.2-cli libapache2-mod-php8.2 php8.2-mysql php8.2-gd php8.2-curl php8.2-bcmath php8.2-mbstring php8.2-xml php8.2-tokenizer php8.2-zip -y
clear
echo "Iniciando todos los servicios.."
sed -i 's/display_errors = Off/display_errors = On/g' /etc/php/8.2/apache2/php.ini
sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf
sed -i 's/;extension=fileinfo/extension=fileinfo/g' /etc/php/8.2/apache2/php.ini
sed -i 's/;extension=openssl/extension=openssl/g' /etc/php/8.2/apache2/php.ini
a2enconf php8.2-fpm
a2enmod php8.2 rewrite
rm -R /var/www/html
#cp /home/script.sh /root/
#chmod +x /root/script.sh
#echo "alias iniciar='/root/./script.sh'" >> /root/.bashrc
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

