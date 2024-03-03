###################
#                 #
#   DOCKERFILE    #
#                 #
###################

FROM debian:buster
#───────────────────────────────────────────────────────────────────────#
# This command specifies the base image that the docker image being     #
# built should be based on. "buster" is the codename for Debian 10.     #
#_______________________________________________________________________#

# Update and install nginx
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

EXPOSE 443
#───────────────────────────────────────────────────────────────────────#
# This command indicates what ports should the container listen to at   #
# runtime. As per the subject, NGINX should listen on port 443.         #
#_______________________________________________________________________#

COPY ./conf/default /etc/nginx/sites-enabled/default

# Copy script to generate ssl certificate and give permission
COPY ./tools/nginx.sh /var/www
RUN chmod +x /var/www/nginx.sh

# Expose port 443

ENTRYPOINT [ "/var/www/nginx.sh" ]

# Default command
CMD ["nginx", "-g", "daemon off;"]

###################
#                 #
#     jlebre      #
#                 #
###################