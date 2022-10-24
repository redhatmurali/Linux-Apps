Zimbra instalaltion on centos 8 


How to remove DNSCACHE from zimbra services.
13
AUG
How to remove DNSCACHE from zimbra services.

If you will get a prompt stating something like “Port conflict detected: 53 (zimbra-dnscache)” with a prompt to hit ENTER to continue, you can just hit enter and let the installation/upgrade run out. Once everything is running, you will see that the Zimbra DnsCahe service is in a stopped state. To fix this error, all you have to do is

# zmcontrol status
# zmprov ms `zmhostname` -zimbraServiceEnabled dnscache
# zmprov ms `zmhostname` -zimbraServiceInstalled dnscache
# zmcontrol status


DomainKeys Identified Mail (DKIM) lets an organization take responsibility for a message that is in transit. The organization is a handler of the message, either as its originator or as an intermediary. Their reputation is the basis for evaluating whether to trust the message for further handling, such as delivery. Technically DKIM provides a method for validating a domain name identity that is associated with a message through cryptographic authentication.

Generate DKIM

su - zimbra
/opt/zimbra/libexec/zmdkimkeyutil -a -d norditsz.tk
Updating DKIM data for a domain

 /opt/zimbra/libexec/zmdkimkeyutil -u -d norditsz.tk
Removing DKIM data for a domain

 /opt/zimbra/libexec/zmdkimkeyutil -r -d norditsz.tk


SSL INstalaltion

https://bobcares.com/blog/secure-zimbra-server-with-lets-encrypt-certificate/

ZImbra instalaltion 
https://inguide.in/install-zimbra-mail-server-on-centos-step-by-step/
