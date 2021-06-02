FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./conf/setup.sh ./setup.sh

RUN service mysql start

CMD mysqld && sh /setup.sh
