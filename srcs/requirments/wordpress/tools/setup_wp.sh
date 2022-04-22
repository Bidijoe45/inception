#!/bin/bash

wp core download --path=$WORDPRESS_INSTALLATION_PATH --allow-root;
wp config create --path=$WORDPRESS_INSTALLATION_PATH --dbhost=mariadb --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_ADMIN_USERNAME --dbpass=$MYSQL_ADMIN_PASSWORD --allow-root;
wp db create --path=$WORDPRESS_INSTALLATION_PATH --allow-root;
wp core install --path=$WORDPRESS_INSTALLATION_PATH --url=localhost --title="El blog de Apavel" --admin_user=$WP_ADMIN_USER_NAME --admin_password=$WP_ADMIN_USER_PASS --admin_email=$WP_ADMIN_USER_EMAIL --allow-root;
wp user create --path=$WORDPRESS_INSTALLATION_PATH $WP_AUTHOR_USER_NAME $WP_AUTHOR_USER_EMAIL --user_pass=$WP_AUTHOR_USER_PASS --role=author --allow-root

exec php-fpm7.3 --nodaemonize