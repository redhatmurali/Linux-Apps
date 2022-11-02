apt update && apt upgrade -y

hostnamectl set-hostname mail.yourdomain.in

vi /etc/hosts

127.0.0.1       localhost
127.0.1.1       mail.yourdomain.in mail
65.108.241.217   mail.yourdomain.in mail

systemctl disable systemd-resolved
systemctl stop systemd-resolved

ls -lh /etc/resolv.conf

rm -f /etc/resolv.conf
vi  /etc/resolv.conf

nameserver 8.8.8.8

apt install dnsmasq -y

cp /etc/dnsmasq.conf /etc/dnsmasq.conf.bak

vi /etc/dnsmasq.conf

server= 65.108.241.217
domain=yourdomain.in
mx-host= yourdomain.in, mail.yourdomain.in, 5
mx-host= mail.yourdomain.in, email.yourdomain.in, 5
listen-address=127.0.0.1

dig -t A mail.yourdomain.in

dig -t MX yourdomain.in


# Installing Zimbra Open Source Edition

wget https://files.zimbra.com/downloads/8.8.15_GA/zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954.tgz

tar xvzf zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954.tgz

cd zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954

./install.sh

su zimbra

zmcontrol status


reboot 

if services not running 

zmopendkimctl restart

zmcontrol restart

https://mail.yourdomain.in:7071

service ufw status

ufw allow 22,25,80,110,143,443,465,587,993,995,5222,5223,9071,7071/tcp


# Instiallation of SSL on Zimbra

sudo apt install -y net-tools dnsutils
su zimbra
source ~/bin/zmshutil; zmsetvars
zmhostname
hostname --fqdn

sudo apt install -y net-tools dnsutils

sudo su zimbra -
zmprov ms `zmhostname` zimbraReverseProxyMailMode https
zmprov ms `zmhostname` zimbraMailMode https
/opt/zimbra/bin/zmtlsctl https
/opt/zimbra/libexec/zmproxyconfig -e -w -o -a 8080:80:8443:443 -x https -H `zmhostname`

exit

apt install -y python3 python3-venv libaugeas0
python3 -m venv /opt/certbot/
/opt/certbot/bin/pip install --upgrade pip
/opt/certbot/bin/pip install certbot
ln -s /opt/certbot/bin/certbot /usr/local/sbin/certbot
/usr/local/sbin/certbot certonly -d $(hostname --fqdn) --standalone --preferred-chain  "ISRG Root X1" --agree-tos --register-unsafely-without-email

cat >> /usr/local/sbin/letsencrypt-zimbra << EOF
#!/bin/bash
/usr/local/sbin/certbot certonly -d $(hostname --fqdn) --standalone --manual-public-ip-logging-ok -n --preferred-chain  "ISRG Root X1" --agree-tos --register-unsafely-without-email
cp "/etc/letsencrypt/live/$(hostname --fqdn)/privkey.pem" /opt/zimbra/ssl/zimbra/commercial/commercial.key
chown zimbra:zimbra /opt/zimbra/ssl/zimbra/commercial/commercial.key
wget -O /tmp/ISRG-X1.pem https://letsencrypt.org/certs/isrgrootx1.pem.txt
rm -f "/etc/letsencrypt/live/$(hostname --fqdn)/chainZimbra.pem"
cp "/etc/letsencrypt/live/$(hostname --fqdn)/chain.pem" "/etc/letsencrypt/live/$(hostname --fqdn)/chainZimbra.pem"
cat /tmp/ISRG-X1.pem >> "/etc/letsencrypt/live/$(hostname --fqdn)/chainZimbra.pem"
chown zimbra:zimbra /etc/letsencrypt -R
cd /tmp
su zimbra -c '/opt/zimbra/bin/zmcertmgr deploycrt comm "/etc/letsencrypt/live/$(hostname --fqdn)/cert.pem" "/etc/letsencrypt/live/$(hostname --fqdn)/chainZimbra.pem"'
rm -f "/etc/letsencrypt/live/$(hostname --fqdn)/chainZimbra.pem"
EOF

chmod +rx /usr/local/sbin/letsencrypt-zimbra
ln -s /usr/local/sbin/letsencrypt-zimbra /etc/cron.daily/letsencrypt-zimbra
/etc/cron.daily/letsencrypt-zimbra

sudo su zimbra -c '/opt/zimbra/bin/zmcontrol restart'

# dkim adding to server

 /opt/zimbra/libexec/zmdkimkeyutil -a -d example.com

# updating
 /opt/zimbra/libexec/zmdkimkeyutil -u -d example.com

# deleting or removing

 /opt/zimbra/libexec/zmdkimkeyutil -r -d example.com

# DKIM Verify link 

# https://dkimcore.org/c/keycheck

# SPF verify

# https://mxtoolbox.com/SuperTool.aspx?action=spf
# https://mxtoolbox.com/SuperTool.aspx?%20action=dmarc
# https://mxtoolbox.com/SuperTool.aspx?action=dkim


# https://www.kitterman.com/dmarc/assistant.html?


@   v=DMARC1; p=quarantine; rua=info@yourdomain.in; ruf=info@yourdomain.in; sp=quarantine

yourdomain.in.  IN TXT "v=spf1 mx a ip4:65.108.241.217/24 a:mail.yourdomain.in ~all"

