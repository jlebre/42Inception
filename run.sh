#!/bin/bash

sudo apt-get update
sudo apt-get install -y python3-pip
sudo apt-get install -y git
sudo apt-get install -y docker.io
sudo apt-get install -y docker-compose
sudo apt-get install -y nginx

git clone https://www.github.com/jlebre/42Inception.git
cd 42Inception
make
