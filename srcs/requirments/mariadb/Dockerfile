FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./conf/setup.sh ./setup.sh
RUN service mysql start && mysql -u "root" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" && \
mysql -u "root" -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN_USERNAME'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';" && \
mysql -u "root" -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON * . * to '$MYSQL_ADMIN_USERNAME'@'localhost'; FLUSH PRIVILEGES;" && \
mysql -u "$MYSQL_ADMIN_USERNAME" -p "$MYSQL_ADMIN_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;"


CMD mysqld_safe
