#!/bin/sh
## Loading Variables
IP_ADDR=192.168.30.XXX
REVERSE_ZONE=30.168.192.in-addr.arpa.
HOSTNAME=SERVER_NAME.example.com
SHORTNAME=testserver
DOMAIN=example.com
REALM=EXAMPLE.COM

## Starting and Enabling Firewalld
systemctl enable firewalld ; systemctl start firewalld

## Masquerade the Network
firewall-cmd --add-masquerade --permanent; firewall-cmd --reload

## Install IPA Server and Others tools
yum install -y ipa-server ipa-server-dns bind-dyndb-ldap

## Setting the right config on hosts file
echo "$IP_ADDR $HOSTNAME $SHORTNAME" >> /etc/hosts

# Installing everything unattended
ipa-server-install --domain=$DOMAIN --realm=$REALM --ds-password=password --admin-password=password --hostname=$HOSTNAME --ip-address=$IP_ADDR --reverse-zone=$REVERSE_ZONE --forwarder=8.8.8.8 --allow-zone-overlap --setup-dns --unattended
