#!/bin/bash

# 文件存在 ===============================
function isExist(){
  if ls $1 > /dev/null 2>&1; then
      echo true
      return
  fi
  echo false
}
# is_exist=$(isExist /dev/sdb2)



if [[ $1 == "on" ]]; then
  echo "mount..."
  # sudo udisksctl mount --no-user-interaction -b /dev/sdb2
  sudo mount /dev/sdb2 /home/zdz/mntout
fi

if [[ $1 == "off" ]]; then
  echo "umount..."
  sudo umount /home/zdz/mntout
  # sudo udisksctl unmount --no-user-interaction -b /dev/sdb2
  sleep 3
  sudo udisksctl power-off --no-user-interaction -b /dev/sdb2
fi


# ./mount.sh on
# ./mount.sh off
