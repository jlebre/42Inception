#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y python3-pip
sudo apt-get install -y git
sudo apt-get install -y docker.io
sudo apt-get install -y docker-compose
sudo apt-get install -y nginx
sudo apt-get install -y mariadb-server mariadb-client

#git clone https://www.github.com/jlebre/42Inception.git
#cd 42Inception
#make
