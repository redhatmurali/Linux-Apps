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
