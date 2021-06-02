FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout\
    /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt\
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=INCEPTION"

RUN rm -rf /etc/nginx/sites-enabled/default*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/apavel.42.fr /etc/nginx/sites-available/apavel.42.fr
RUN ln -s /etc/nginx/sites-available/apavel.42.fr /etc/nginx/sites-enabled/

RUN ln -sf /dev/stdout /var/log/nginx/acess.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
