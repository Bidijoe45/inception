FROM debian:buster

ARG MYSQL_ADMIN_USERNAME
ARG MYSQL_ADMIN_PASSWORD
ARG WORDPRESS_DB_NAME

RUN apt-get update && \
	apt-get install -y	curl \
			mariadb-client \ 
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
COPY ./tools/setup_wp.sh /setup_wp.sh

RUN mkdir -p /run/php
RUN chown www-data:www-data /run/php/
RUN mkdir -p /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp

RUN chown -R www-data:www-data /var/www/*
RUN chown www-data:www-data /setup_wp.sh
RUN touch /var/log/php7.3-fpm.log
RUN chown www-data:www-data /var/log/php7.3-fpm.log

USER www-data

ENTRYPOINT ["sh", "setup_wp.sh"]