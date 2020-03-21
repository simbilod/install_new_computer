#!/bin/bash
echo "fs-a39c380a:/ $HOME/efs efs defaults,_netdev 0 0" | sudo tee -a /etc/fstab

if [[ ! -d efs-utils ]]; then
  git clone https://github.com/aws/efs-utils
fi

cd efs-utils

if [[ -d /home/ubuntu ]]; then
  sudo apt-get update
  sudo apt-get -y install binutils
  ./build-deb.sh
  sudo apt-get -y install ./build/amazon-efs-utils*deb
elif [[ -d /home/centos ]]; then
  make rpm
  sudo yum -y install build/amazon-efs-utils*rpm
  make rpm
  sudo yum -y install build/amazon-efs-utils*rpm
fi
