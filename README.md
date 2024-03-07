# 42Inception
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

# Docker

# MariaDB

# Wordpress

# NGINX

# VM Setup
## Basic setup:
Enter as root and install vim, make, git, curl, docker and docker-compose:
```
sudo apt-get install -y vim make git curl docker.io docker-compose
```

Give privileges to your user:
```
sudo usermod -aG sudo "login"
sudo usermod -aG docker "login"
```

## Add your domain to /etc/hosts:
```
sudo vim /etc/hosts
```
Add the domain:
```
127.0.0.1  login.42.fr
127.0.0.1  www.login.42.fr
```
## Run the project:
Exit root, clone the repository and start the Makefile:
```
git clone https://www.github.com/jlebre/42Inception.git && cd 42Inception
```
⚠️ Don't forget to change all references to "jlebre" inside the project to match your login.

Then you can run everything with "make".
#
![100](https://github.com/jlebre/42Inception/assets/94384240/45ddc38c-885f-4df2-aa2c-b2a886c20738)

