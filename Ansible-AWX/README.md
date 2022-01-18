# AWX On Centos8 With Docker

Add EPEL repo

```bash
yum install epel-release
```

Install Ansible

```bash
yum install ansible
```

Confirm installation and version

```bash
ansible --version
```

# Installing Docker

Disable firewalld

```bash
systemctl disable firewalld
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
or
yum install https://download.docker.com/linux/centos/8/x86_64/stable/Packages/containerd.io-1.4.4-3.1.el8.x86_64.rpm
```

Install docker CE

```bash
yum install docker-ce docker-ce-cli
```
Start docker service
```bash
systemctl start docker
systemctl enable docker
docker version
```

Install docker-compose python module

```bash
pip3 install docker-compose
```

# Prerequisite

Install make

```bash
yum install make
```

Install git

```bash
yum install git
```

# Run AWX Installer

```bash
# git clone -b 17.0.1 https://github.com/ansible/awx.git
git clone -b 11.2.0  https://github.com/ansible/awx.git
cd awx
cd installer
```

# Run installer

ansible-playbook -i inventory install.yml

# Firewall Enable
```bash
firewall-cmd --zone=public --add-masquerade --permanent
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
```
# Password Reset
```bash
docker ps
docker exec -it awx_web bash
awx-manage changepassword admin
```
```bash
default admin / password
```
# AWX On Centos8 With Kubernetis Cluster

