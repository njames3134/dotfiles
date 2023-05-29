#!/bin/bash

DIR="$HOME/remote"

fusermount -u "$DIR"
#if [ -d "$DIR" ]; then
#  if [ "$(ls -A "$DIR")" ]; then
#    fusermount -u "$DIR"
#    if [ $? -eq 0 ]; then
#      echo "$DIR has been unmounted"
#    else
#      echo "Failed to unmount $DIR"
#    fi
#  else
#    echo "$DIR is already empty" 
#  fi
#else
#  echo "$DIR does not exist" 
#fi
