# DOCKER INSTALLATION

Add EPEL repo

```bash
  yum install epel-release
```

Install Python3

```bash
  dnf install python3
```

Confirm installation and version

```bash
  ansible --version
```

# Installing Docker

Disable firewalld

```bash
  systemctl disable firewalld
```

Stop firewalld

```bash
  systemctl stop firewalld
```

Install Yum utils

```bash
  yum install yum-utils
```

Add the docker repo to yum

```bash
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

Install containerd

```bash
  yum install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
```

or

```bash
 yum install https://download.docker.com/linux/centos/8/x86_64/stable/Packages/containerd.io-1.4.4-3.1.el8.x86_64.rpm
```

Install docker CE

```bash
 yum install docker-ce docker-ce-cli
```

Start docker service

```bash
 systemctl start docker
```

Enable service to start after reboots

```bash
 systemctl enable docker
```

Confirm version and operational status

```bash
 docker version
```

Install docker-compose python module

```bash
  pip3 install docker-compose
```

# Install ManageIQ

```bash
  sudo systemctl start docker

  docker pull manageiq/manageiq:kasparov-1

  docker run -d -p 8443:443 manageiq/manageiq:kasparov-1

  https://localhost:8443

```

admin / smartvm
