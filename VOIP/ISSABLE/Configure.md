
yum install git 
yum -y install sqlite-devel
yum -y install tcl asterisk13-devel make automake binutils wget screen minicom

git clone https://github.com/wdoekes/asterisk-chan-dongle.git
cd asterisk-chan-dongle/
./bootstrap
./configure --with-astversion=13.29.2

make
make install
cp ./etc/dongle.conf /etc/asterisk/

yum install usb_modeswitch*

ls -la /dev | grep ttyUSB

yum install usbutils

lsusb

asterisk -vvvr

module load chan_dongle.so

cp etc/dongle.conf /etc/asterisk/
cp chan_dongle.so /usr/lib64/asterisk/modules/
service asterisk restart
echo "rungroup=dialout" >> /etc/asterisk/asterisk.conf;
echo 'KERNEL=="ttyUSB*", MODE="0666", OWNER="asterisk", GROUP="uucp"' /etc/udev/rules.d/92-dongle.rules;
reboot
