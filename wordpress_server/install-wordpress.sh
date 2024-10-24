#!/bin/bash
# variable will be populated by terraform template
db_username=${db_username}
db_user_password=${db_user_password}
db_name=${db_name}
db_RDS=${db_RDS}

sudo dnf update -y
sudo dnf install wget php-mysqlnd httpd php-fpm php-mysqli mariadb105 mariadb105-server php-json php php-devel -y

sudo systemctl enable php-fpm
sudo systemctl start php-fpm
sudo systemctl enable httpd
sudo systemctl start httpd

sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
find /var/www -type d -exec dchmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;

# # Download wordpress package and extract
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm -f latest.tar.gz
cp -r wordpress/* /var/www/html/
# Create wordpress configuration file and update database value
cd /var/www/html
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$db_name/g" wp-config.php
sed -i "s/username_here/$db_username/g" wp-config.php
sed -i "s/password_here/$db_user_password/g" wp-config.php
sed -i "s/localhost/$db_RDS/g" wp-config.php
cat <<EOF >>/var/www/html/wp-config.php
define( 'FS_METHOD', 'direct' );
define('WP_MEMORY_LIMIT', '128M');
EOF

sudo chown -R ec2-user:apache /var/www/html
chmod -R 774 /var/www/html

sudo sed -i '/<Directory "\/var\/www\/html">/,/<\/Directory>/ s/AllowOverride None/AllowOverride all/' /etc/httpd/conf/httpd.conf

sudo systemctl restart php-fpm
sudo systemctl restart httpd
echo "WordPress Installed"