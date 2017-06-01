#!/bin/sh

# Enable commonly used apache modules
sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ expires_module/LoadModule\ expires_module/' /etc/apache2/httpd.conf

sed -i "s#^DocumentRoot \".*#DocumentRoot \"/var/www/localhost/htdocs/\"#g" /etc/apache2/httpd.conf
printf "\n<Directory \"/var/www/localhost/htdocs/\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf

chown -R apache:apache /var/www/localhost/htdocs

httpd -D FOREGROUND
