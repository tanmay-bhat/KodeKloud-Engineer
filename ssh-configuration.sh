#!/bin/bash

set -eu

if ! command -v ssh-keygen &> /dev/null ;then
    echo "Cant seem to find 'ssh-keygen' binary, are you sure its installed ?"
    exit 1
fi
if ! command -v ssh &> /dev/null ;then
    echo "Cant seem to find 'ssh' binary, are you sure its installed ?"
    exit 1
fi

#=====================install sshpass=====================
echo "Note : Enter the password 'mjolnir123' when prompted for user '$(whoami)' to install the package: 'sshpass'" 
echo

echo "installing the sshpass package........"
echo
sudo yum install sshpass -y &> /dev/null
echo

#=====================generate ssh key====================
echo "generating ssh keys..............."
echo
ssh-keygen -t rsa -b 2048 -f "$HOME"/.ssh/id_rsa -N "" <<< y &> /dev/null
if [ -z "$(ls -A $HOME/.ssh/)" ]; then
   echo "ssh keys failed to generate at location $HOME/.ssh/"
else
   echo  "ssh keys sucessfuly generated at $HOME/.ssh"
fi

#================copy public key to all servers===========
echo
echo "copying public key to all servers................."
echo 
sshpass -p 'Am3ric@' ssh-copy-id -i $HOME/.ssh/id_rsa.pub steve@172.16.238.11 -o StrictHostKeyChecking=no &> /dev/null
sshpass -p 'Ir0nM@n' ssh-copy-id -i $HOME/.ssh/id_rsa.pub tony@172.16.238.10 -o StrictHostKeyChecking=no &> /dev/null
sshpass -p 'BigGr33n' ssh-copy-id  -i $HOME/.ssh/id_rsa.pub banner@172.16.238.12 -o StrictHostKeyChecking=no &> /dev/null
# sshpass -p 'Sp!dy' ssh-copy-id -i $HOME/.ssh/id_rsa.pub peter@172.16.239.10 -o StrictHostKeyChecking=no #&> /dev/null
# sshpass -p 'Bl@kW' ssh-copy-id -i $HOME/.ssh/id_rsa.pub natasha@172.16.238.15 -o StrictHostKeyChecking=no #&> /dev/null
# sshpass -p 'H@wk3y3' ssh-copy-id -i $HOME/.ssh/id_rsa.pub clint@172.16.238.16 -o StrictHostKeyChecking=no #&> /dev/null
# sshpass -p 'Gr00T123' ssh-copy-id -i $HOME/.ssh/id_rsa.pub groot@172.16.238.17 -o StrictHostKeyChecking=no #&> /dev/null
# sshpass -p 'j@rv!s' ssh-copy-id -i $HOME/.ssh/id_rsa.pub jenkins@172.16.238.19 -o StrictHostKeyChecking=no #&> /dev/null 
echo 

#update ssh config for remote server hostname & username
echo "configuring ssh config for all servers............."
echo 

mkdir -p ~/.ssh && chmod 700 ~/.ssh 
touch ~/.ssh/config && chmod 600 ~/.ssh/config

cat <<EOF >  ~/.ssh/config
Host app1
    HostName 172.16.238.10 
    User tony
Host app2
    HostName 172.16.238.11
    User steve
Host app3
    HostName 172.16.238.12
    User banner
Host db
    HostName 172.16.239.10
    User peter
Host storage
    HostName 172.16.238.15
    User natasha
Host backup
    HostName 172.16.238.16
    User clint
Host mail
    HostName 172.16.238.17
    User groot
Host jenkins
    HostName 172.16.238.19
    User jenkins    
EOF


if [ -f $HOME/.ssh/config ]; then
   echo "SSH config sucessfully generated for all servers"
else
   echo  "Couldn't generate ssh config file at $HOME/.ssh/config"
fi

echo
echo "You can now ssh into the servers using their short name
for example 'ssh jenkins' or 'ssh app1' etc......"
echo 
echo "Check the file ~/.ssh/config for list of servers you can connect to"
echo
