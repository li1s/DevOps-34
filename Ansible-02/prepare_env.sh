#!/usr/bin/env bash
vagrant up
ssh-keygen -f $HOME"/.ssh/known_hosts" -R "192.168.1.10"
sshpass -p ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=5 vagrant@192.168.1.10 'exit 0'
echo $?
sleep 15
ssh-keygen -f $HOME"/.ssh/known_hosts" -R "192.168.1.11"
sshpass -p ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=5 vagrant@192.168.1.11 'exit 0'
echo $?