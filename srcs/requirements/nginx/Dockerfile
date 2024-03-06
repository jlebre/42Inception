FROM debian:buster

RUN apt-get update -y && apt-get install nginx openssl libssl-dev -y

RUN rm -rf /etc/nginx/conf.d/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt  -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/CN=jlebre";

EXPOSE 443

ENTRYPOINT [ "bash" , "nginx.sh" ]
