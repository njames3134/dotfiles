#!/bin/bash

DIR="$HOME/.config/nvim"

read -p "Enter the hostname: " hostname
read -p "Enter the username: " username
read -p "Enter file path: " filepath 
read -p "Enter the password: " -s password

target="$username@$hostname"
export SSHPASS=$password
echo "$password" | sshpass -e ssh $target exit
if [ $? -eq 0 ]; then
    echo "Target added successfully"
    echo "target$(wc -l < $DIR/sshfs_targets.cfg | tr -d ' ')= $target:$filepath" >> $DIR/sshfs_targets.cfg
else
    echo "Failed to add target"
fi
