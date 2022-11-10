https://techexpert.tips/otrs/otrs-installation-ubuntu-linux/

apt-get update
apt-get install libdatetime-perl libcrypt-eksblowfish-perl libcrypt-ssleay-perl libgd-graph-perl libapache-dbi-perl libsoap-lite-perl libarchive-zip-perl libgd-text-perl libnet-dns-perl libpdf-api2-perl libauthen-ntlm-perl libdbd-odbc-perl libjson-xs-perl libyaml-libyaml-perl libxml-libxml-perl libencode-hanextra-perl libxml-libxslt-perl libpdf-api2-simple-perl libmail-imapclient-perl libtemplate-perl libtext-csv-xs-perl libdbd-pg-perl libapache2-mod-perl2 libtemplate-perl libnet-dns-perl libnet-ldap-perl libio-socket-ssl-perl libmoo-perl libdbd-mysql-perl

apt-get install mariadb-server

vi /etc/mysql/mariadb.conf.d/50-otrs.cnf

[mysqld]
max_allowed_packet=64M
query_cache_size=36M
innodb_log_file_size=256M

service mariadb restart

mysql -u root -p

CREATE DATABASE otrs DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON otrs.* TO otrs@localhost IDENTIFIED BY 'Kema.123#';
quit;

apt-get install apache2 libapache2-mod-perl2

a2enmod perl
a2enmod headers
a2enmod deflate
a2enmod filter

service apache2 restart

useradd -d /opt/otrs -c 'OTRS user' otrs
usermod -aG www-data otrs

mkdir /downloads
cd /downloads

wget https://otrscommunityedition.com/download/otrs-community-edition-6.0.37.tar.bz2

tar -jxvf otrs-community-edition-6.0.37.tar.bz2

mv otrs-community-edition-6.0.37 /opt/otrs

apt-get install -y libjavascript-minifier-xs-perl
apt-get install -y libcss-minifier-xs-perl

/opt/otrs/bin/otrs.CheckModules.pl

cp /opt/otrs/Kernel/Config.pm.dist /opt/otrs/Kernel/Config.pm

vi /opt/otrs/Kernel/Config.pm

$Self->{DatabaseHost} = '127.0.0.1';
$Self->{Database} = 'otrs';
$Self->{DatabaseUser} = 'otrs';
$Self->{DatabasePw} = 'Kema.123#';

vi /opt/otrs/scripts/apache2-perl-startup.pl

use DBD::mysql ();
use Kernel::System::DB::mysql;

use strict;
use warnings;
$ENV{MOD_PERL} =~ /mod_perl/ || die "MOD_PERL not used!";
BEGIN {
    if ( !-e $0 || -d $0 ) {
    }
}
use Apache2::RequestRec ();
use ModPerl::Util       ();
use lib "/opt/otrs/";
use lib "/opt/otrs/Kernel/cpan-lib";
use lib "/opt/otrs/Custom";
use CGI ();
CGI->compile(':cgi');
use CGI::Carp ();
use Apache::DBI ();
use DBD::mysql ();
use Kernel::System::DB::mysql;
eval { require Net::DNS };
use DateTime ();
use Template ();
use Encode qw(:all);
1;

/opt/otrs/bin/otrs.SetPermissions.pl --web-group=www-data

ls -la /opt/otrs/

ln -s /opt/otrs/scripts/apache2-httpd.include.conf /etc/apache2/sites-enabled/otrs.conf

perl -cw /opt/otrs/bin/cgi-bin/index.pl
perl -cw /opt/otrs/bin/cgi-bin/customer.pl
perl -cw /opt/otrs/bin/otrs.Console.pl

service apache2 restart

http://192.168.0.10/otrs/installer.pl

http://15.235.187.248/otrs/index.pl



cd /opt/otrs/var/cron
for foo in *.dist; do cp $foo `basename $foo .dist`; done

su - otrs -c "/opt/otrs/bin/otrs.Daemon.pl start"
su - otrs -c "/opt/otrs/bin/Cron.sh start"



SSL instalaltion Manually

https://serverspace.io/support/help/how-to-get-lets-encrypt-ssl-on-ubuntu/























