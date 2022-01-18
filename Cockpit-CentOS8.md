# CockPit Installation Centos 8

```bash
How to Install and Use Cockpit on CentOS 7

dnf install cockpit -y
systemctl start cockpit.socket
systemctl enable cockpit.socket

firewall-cmd --permanent --add-service=cockpit
firewall-cmd --reload

systemctl status cockpit.socket
ss -tunlp | grep cockpit
ps auxf|grep cockpit

https://<System-IP>:9090
```
 Add-ons for COCKPIT
```bash
dnf install -y cockpit-podman
dnf install -y cockpit-machines
dnf install -y cockpit-packagekit
dnf install -y cockpit-session-recording
dnf install -y cockpit-pcp
dnf install -y cockpit-storaged
dnf install -y cockpit-networkmanager
dnf install -y cockpit-389-ds
dnf install -y cockpit-ostree
dnf install -y cockpit-ovirt-dashboard
dnf install -y cockpit-sosreport
dnf install -y cockpit-zfs
dnf install -y cockpit-certificates

```
Cockpit two factor authentication (2FA)
Set SELinux policy (setenforce permissive)

```bash
dnf install epel-release
dnf install google-authenticator
google-authenticator
vi /etc/pam.d/cockpit
auth required pam_google_authenticator.so
systemctl restart cockpit

```
```bash
nervous_feistel
docker.io/manageiq/manageiq:latest	
admin /smartvm


kind_cray
docker.io/bhordupur/bitnami-jenkins-docker:latest	
user / bitnami

````
```bash
yum install libvirt-daemon-config-network
virsh net-list
virsh net-start default
````
