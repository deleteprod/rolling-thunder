#!/bin/bash
# Script to do the SSH public key copy over, in order for ansible to work

system_user=ubuntu

if [[ -f ~/.ssh/id_rsa.pub ]]
then
    echo "SSH key detected - using the default of ~/.ssh/id_rsa.pub"
    for ip in `cat inventory | grep -v "\[" | cut -f1 -d" "`; do
        ssh-copy-id -i ~/.ssh/id_rsa.pub $system_user@$ip
    done
else
    echo "No SSH key detected. You must first generate a key pair using 'ssh-keygen -t rsa'"
    echo "Exiting now."
    exit
fi
