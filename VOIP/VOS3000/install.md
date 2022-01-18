
`````
/etc/init.d/iptables status
/etc/init.d/iptables save
/etc/init.d/iptables stop
chkconfig iptables off
/etc/init.d/ip6tables save
/etc/init.d/ip6tables stop
chkconfig ip6tables off
nano  /etc/sysconfig/selinux
# setenforce 0
# sh create_user_kunshi.sh
# sh create_user_kunshiweb.sh
# cd
# cd /vos
# cd vos
# ls
# yum install perl-DBI-1.40-5.i386.rpm
# ls
# yum install perl-DBI-1.40-5.i386.rpm -y
# yum remove mysql
# yum remove mysql-libs
# yum install perl-libwww-perl
# rpm -ivh MySQL-server-community-5.0.96-1.rhel5.x86_64.rpm
# rpm -ivh MySQL-client-community-5.0.96-1.rhel5.x86_64.rpm
# vi /etc/my.cnf
==========================
[client]
port=3306
default-character-set=utf8
[mysqld]
default-character-set=utf8
max_connections=160
interactive_timeout=310000
wait_timeout=31000
query_cache_size=48M
table_cache=320
tmp_table_size=52M
thread_cache_size=8
sort_buffer_size=256K
innodb_thread_concurrency=8
myisam-recover=FORCE
max_allowed_packet=32M
innodb_file_per_table=1



# service mysql restart
# rpm -ivh jdk-6u45-linux-amd64.rpm
# tar zxvf apache-tomcat-7.0.23.tar.gz
# mv apache-tomcat-7.0.23 /home/kunshiweb/base/apache-tomcat
# chmod 777 jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin
# ./jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin
# cp -r /root/jrockit-jdk1.6.0_45-R28.2.7-4.1.0 /home/kunshi/base/jdk_default
# cp -r /root/jrockit-jdk1.6.0_45-R28.2.7-4.1.0 /home/kunshiweb/base/jdk_default
# rpm -ivh vos3000-2.1.4-0.i586.rpm
# rpm -ivh emp-2.1.4-0.noarch.rpm
# rpm -ivh callservice-2.1.4-0.i586.rpm
# rpm -ivh mgc-2.1.4-0.i586.rpm
# rpm -ivh vos3000-web*.rpm
# rpm -ivh mbx3000-2.1.4-0.i586.rpm
# rpm -ivh ivr_dial-2.1.4-0.i586.rpm
# mkdir /home/kunshi/license
# chmod 777 vos30002140.bin
# ./vos30002140.bin
# ifconfig
# cd
# cd AntiBackDoor\ Files/
# cp libcap.so /home/kunshi/vos3000/server/lib/libcap.so
# cp vos3000d /etc/init.d/vos3000d
# cp vos3000webct /etc/init.d/vos3000webct
# cd ..
# cd phoneservice_Install
# ls
# cp -R phoneservice /home/kunshi/
# cd /home/kunshi
# chmod 777 /home/kunshi/phoneservice/bin/phoneservice
# cd /root/vos
# cd phoneservice_Install
# ls
# cp phoneserviced /etc/init.d/
# chmod 777 /etc/rc.d/init.d/phoneserviced
# chkconfig phoneserviced on
# service phoneserviced restart
# cd
# service vos3000d restart
# service mbx3000d restart
# chkconfig iptables off
#
# reboot
