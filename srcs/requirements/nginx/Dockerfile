FROM debian:buster

RUN apt-get update -y && apt-get install nginx openssl -y

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

CMD [ "./nginx.sh" ]
