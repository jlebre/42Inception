# 42Inception

<p align="center">
  <img src="https://user-images.githubusercontent.com/94384240/170163573-2e001946-86f1-406b-9959-b0c39a007c0b.jpeg" alt="42 School Logo" width="300">
</p>

## 🏛 42 Cursus - Inception

This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images and configure them in your personal virtual machine.

📜 To see the project subject, [click here](https://github.com/user-attachments/files/19511359/Inception.pdf)!  

---

### Technologies:
- **Docker**: Containerizing applications for virtualization.
- **MariaDB**: Database server setup and configuration.
- **WordPress**: Deploying WordPress with Docker and connecting it to MariaDB.
- **NGINX**: Setting up NGINX as a reverse proxy for WordPress.

---

## 🛠 Setup and Configuration

### VM Setup

#### Basic Setup:
Enter as root and install the necessary tools:
```bash
sudo apt-get install -y vim make git curl docker.io docker-compose
```

Grant privileges to your user:
```bash
sudo usermod -aG sudo "login"
sudo usermod -aG docker "login"
```

#### Update /etc/hosts:
```bash
sudo vim /etc/hosts
```
Add the following domains:
```
127.0.0.1  login.42.fr
127.0.0.1  www.login.42.fr
```

### Run the Project:
Clone the repository and use the Makefile:
```bash
git clone https://www.github.com/jlebre/42Inception.git && cd 42Inception
```
⚠️ Change all references to "jlebre" inside the project to match your login.

Then run everything with `make`:
```bash
make
```

---

![Screenshot 2025-03-28 194700](https://github.com/user-attachments/assets/49279b18-e08d-46dd-827f-e95926a40760)


---

![100](https://user-images.githubusercontent.com/94384240/170165431-9908395e-0389-4a13-a0cc-2593a32a0939.png)
