#!/bin/bash

DIR="$HOME/.config/nvim"

declare -A targets

# get target list
while read line; do
    if [[ $line =~ ^target([0-9]+)= ]]; then
        target=${line#*=}
        targets[${BASH_REMATCH[1]}]=$target
        echo "${BASH_REMATCH[1]}) $target"
    fi
done < $DIR/sshfs_targets.cfg

# get requested target
read -p "Enter target number: " target_num
target=${targets[$target_num]}

# mount home directory of ssh target
sshfs_opts="\
  -o Compression=no      \
  -o attr_timeout=115200 \
  -o entry_timeout=1200  \
  -o follow_symlinks     \
  -o reconnect           \
  -o max_conns=12        
"
sshfs $sshfs_opts $target ~/remote

echo "Enter path to requested mount location: "

path="$HOME/remote"
remote_path=""
while true; do 
  echo "Current path: $path"
  ls "$path"
  echo "Enter a directory to enter (or 'done' to end): "
  read input

  if [ "$input" == "done" ]; then
    break 
  fi 

  path="$path/$input"
  remote_path="$remote_path/$input"

  cd "$path"
done

cd

fusermount -u ~/remote

sshfs $sshfs_opts $target/"$remote_path" ~/remote
