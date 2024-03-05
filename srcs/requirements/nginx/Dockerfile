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

RUN apt-get update -y && apt-get install nginx openssl -y
#───────────────────────────────────────────────────────────────────────#
# Update everything and install:                                        #
# - nginx: Nginx web server, which is a popular web server known        #
# for its performance, reliability, and scalability.                    #
# - openssl: used for secure communication and cryptographic operations.#
#                                                                       #
# The "-y" option is used to automatically answer "yes" to prompts      #
# that may appear during installation.                                  #
#_______________________________________________________________________#

EXPOSE 443
#───────────────────────────────────────────────────────────────────────#
# This command indicates what ports should the container listen to at   #
# runtime. As per the subject, NGINX should listen on port 443.         #
#_______________________________________________________________________#

COPY ./conf/default /etc/nginx/sites-enabled/default
#───────────────────────────────────────────────────────────────────────#
# Copy the NGINX default site configuration file to the appropriate     #
# directory within the container.                                       #
#_______________________________________________________________________#

COPY ./tools/nginx.sh /
#───────────────────────────────────────────────────────────────────────#
# Copy the NGINX startup script to the appropriate directory within     #
# the container and set execute permissions for it.                     #
#_______________________________________________________________________#

CMD [ "/nginx.sh" ]
#───────────────────────────────────────────────────────────────────────#
# Define the default command to start NGINX in foreground mode.         #
#_______________________________________________________________________#

###################
#                 #
#     jlebre      #
#                 #
###################