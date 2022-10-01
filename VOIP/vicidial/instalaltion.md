yum check-update
yum update -y
yum -y install epel-release
yum update -y
yum groupinstall 'Development Tools' -y
yum install git -y
yum install kernel*

#Disable SELINUX
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config    
systemctl disable firewalld

reboot


git clone https://github.com/jaganthoutam/vicidial-install-scripts.git
cd vicidial-install-scripts

chmod +x vicidial-install-centos7.sh
./vicidial-install-centos7.sh

git clone https://github.com/wdoekes/asterisk-chan-dongle.git
cd asterisk-chan-dongle/
./bootstrap
./configure --with-astversion=13.29.2

make
make install
cp ./etc/dongle.conf /etc/asterisk/

yum install usb_modeswitch*

yum install usbutils

