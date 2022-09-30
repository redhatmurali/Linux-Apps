yum check-update

yum update -y

yum install epel-release -y

yum update -y

yum groupinstall 'Development Tools' -y

yum install git -y

yum install kernel* -y

#Disable SELINUX

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config   

reboot
