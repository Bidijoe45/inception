#!/bin/bash

wp core download --path=/var/www/wordpress/ --allow-root
wp config create --path=/var/www/wordpress/ --dbhost=mariadb --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_ADMIN_USERNAME --dbpass=$MYSQL_ADMIN_PASSWORD --allow-root;
wp db create --allow-root;
wp core install --path=/var/www/wordpress/ --url=localhost --title="Prueba" --admin_user=$WP_ADMIN_USER_NAME --admin_password=$WP_ADMIN_USER_PASS --admin_email=$WP_ADMIN_USER_EMAIL --allow-root;
wp user create $WP_SECOND_USER_NAME $WP_SECOND_USER_EMAIL --user_pass=$WP_SECOND_USER_PASS --role=author

exec php-fpm7.3 --nodaemonize