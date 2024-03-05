FROM debian:buster

RUN apt-get update -y && apt-get install nginx openssl -y

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

EXPOSE 443

CMD [ "./nginx.sh" ]
