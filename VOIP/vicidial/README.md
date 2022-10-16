
///
yum check-update
yum update -y
yum -y install epel-release
yum -y groupinstall 'Development Tools'
yum -y update
yum install -y kernel*
///
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
timedatectl set-timezone America/New_York



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

###### vicidial installation centos7.9###########

git clone https://github.com/redhatmurali/Linux/tree/main/VOIP/vicidial.git

cd vicidial

chmod +x vicidial-centos7.sh

./vicidial-centos7.sh

#########webrtc installation#############

chmod +x vicidial-webrtc.sh

./vicidial-webrtc.sh
