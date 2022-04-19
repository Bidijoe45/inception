wp config create --path=/var/www/wordpress/ --dbhost=mariadb --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_ADMIN_USERNAME --dbpass=$MYSQL_ADMIN_PASSWORD --allow-root
wp db create
wp core install --url=localhost --title="Prueba" --admin_user==$MYSQL_ADMIN_USERNAME --admin_password==$MYSQL_ADMIN_PASSWORD --admin_email=apavel@email.com
exec php-fpm7.3 --nodaemonize