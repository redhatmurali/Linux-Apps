
#  ANSIBLE MANUAL INSTALALTION & CONFIG
````
sudo yum install epel-release

sudo yum install ansible
````

MAC

```
CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install --user ansible
```
```
mkdir firmname
```
cd firmname
```
vi ansible.cfg
```
```
[defaults]
inventory =inventory
````
vi inventory
```
[Master]
192.168.2.85
```
````
[client]
192.168.2.105
````
sshd-keygen

**Copy ssh key from ansible to Clients/Nodes**
```
ssh-copy-id root@192.168.2.85
```
Install ansible module if need
```
ansible-galaxy collection install ansible.posix
```
To test connection
```
ansible all -m ping
```
Now excute playbooks 
```
ansible-playbooks http.yaml
```
# in cases need to install using user then need to add SUDO

login to Ansible Server 

ssh asnible@workstation

sudo useradd ansible

sudo passwd ansible

ssh root@node1

useradd ansible && echo ansible | password --stdin ansible

vi /etc/sudoers.d/ansible

insert as below
 %ansible ALL=(ALL) NOPASSWD: ALl

 chmod 0400 /etc/sodoers.d/ansible
 
 DO same on all the nodes and master etc

 now copy the key from ansible server  with login ansible

 su - ansible

ssh-keygen

sshd-copy-id node1

sshd-copy-id node2

