FROM debian:buster

RUN apt-get update
RUN apt-get install -y curl 
RUN apt-get install -y mariadb-client \ 
					php-fpm \
					php-mbstring \
					php-curl \
					php-exif\
					php-fileinfo\
					php-json\
					php-mysqli\
					php-xml\
					php-common

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d 

RUN mkdir -p /run/php
RUN mkdir -p /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --path=/var/www/wordpress/ --allow-root

RUN chown -R www-data:www-data /var/www/*

CMD php-fpm7.3 --nodaemonize && \
	mysql -hmariadb -p3306 -u$MYSQL_ADMIN_USERNAME -p$MYSQL_ADMIN_PASSWORD && \
	wp config create --path=/var/www/wordpress/ --dbhost=mariadb:3306 --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_ADMIN_USERNAME --dbpass=$MYSQL_ADMIN_PASSWORD --allow-root
