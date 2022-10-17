Vicidial instalaltion on Centos 7.9
Downbload Centos 7.9
```
https://ftp.riken.jp/Linux/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso
 
```
```
yum check-update
yum update -y
yum -y install epel-release
yum -y groupinstall 'Development Tools'
yum -y update
yum install -y kernel*

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
timedatectl set-timezone America/New_York
```

