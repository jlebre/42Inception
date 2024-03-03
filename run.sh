#!/bin/bash

apt-get update && apt-get upgrade -y
apt-get install -y vim
apt-get install -y curl
apt-get install -y wget
apt-get install -y make
apt-get install -y python3
apt-get install -y python3-pip
apt-get install -y git
apt-get install -y docker.io
apt-get install -y docker-compose

#git clone https://www.github.com/jlebre/42Inception.git
#cd 42Inception
#make
