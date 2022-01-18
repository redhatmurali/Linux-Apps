````bash

sudo dnf install epel-release
sudo dnf update
sudo hostnamectl set-hostname redhat.murali.lan
sudo dnf install chrony
sudo timedatectl set-timezone Jakarta/Bangkok
sudo systemctl enable --now chronyd
sudo dnf install https://yum.puppet.com/puppet6-release-el-8.noarch.rpm
sudo dnf install https://yum.theforeman.org/releases/2.1/el8/x86_64/foreman-release.rpm
sudo dnf install foreman-installer
sudo foreman-installer -i
sudo firewall-cmd --add-port={22,53,80,443,3000,8140,3306,5432,8443,5910-5930}/tcp --permanent
sudo firewall-cmd --add-port=67-69/udp --permanent
sudo firewall-cmd --reload
https://redhat.murali.lan


yum -y install foreman-ovirt
yum -y install foreman-gce	
yum -y install foreman-ec2	
yum -y install foreman-libvirt	
yum -y install foreman-openstack	
yum -y install foreman-vmware	
`````
