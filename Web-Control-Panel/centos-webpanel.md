# CentOS 7: Installer for CentOS 7 (recommended)

centos-webpanel

```bash
cd /usr/local/src
wget http://centos-webpanel.com/cwp-el7-latest
sh cwp-el7-latest
```

# CentOS 8: Installer for CentOS 8

Set Hostname
```bash
hostnamectl set-hostname webpanel.yourdomain.in
yum -y install wget
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install wget -y
yum -y update
reboot
```

centos-webpanel

```bash
cd /usr/local/src
wget http://centos-webpanel.com/cwp-el8-latest
sh cwp-el8-latest
```
