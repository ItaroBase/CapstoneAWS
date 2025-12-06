#!/bin/bash

# Update system
dnf update -y

# Install Apache, PHP, MariaDB
dnf install -y httpd mariadb1011-server php php-mysqlnd php-fpm php-json php-mbstring php-xml php-gd unzip wget

# Enable and start services
systemctl enable --now httpd mariadb

sleep 5

# Secure MariaDB (non-interactive)
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host!='localhost';"
mysql -e "DROP DATABASE IF EXISTS test;"
mysql -e "FLUSH PRIVILEGES;"

# Create WordPress DB + user
mysql -e "CREATE DATABASE wordpressdb;"
mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Gigane!It%6)9f';" # <-- Temporary password
mysql -e "GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wpuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Install WordPress
cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip

# Remove default Apache test page
rm -f /var/www/html/index.html

# Move WordPress into document root
mv wordpress/* .

# Clean up
rm -rf wordpress latest.zip

# Configure wp-config.php
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/wordpressdb/" wp-config.php
sed -i "s/username_here/wpuser/" wp-config.php
sed -i "s/password_here/Gigane!It%6)9f/" wp-config.php # <-- Temporary password

# Make PHP take priority over HTML
sed -i 's/DirectoryIndex.*/DirectoryIndex index.php index.html/' /etc/httpd/conf/httpd.conf
systemctl restart httpd

# Fix permissions
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html