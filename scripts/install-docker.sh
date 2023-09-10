#!/bin/bash

echo '[INFO] install yum-utils device-mapper-persistent-data'
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sleep 2

echo '[INFO] yum config manager add repo'  
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sleep 2
    
echo '[INFO] start installing docker-ce docker-ce-cli containerd.io'    
sudo yum -y install docker-ce docker-ce-cli containerd.io


echo '[INFO] docker should be installed'

echo '[INFO] sleep 3 seconds and follow with systemctl commands...'
sleep 3

echo '[INFO] starting docker service'
sudo systemctl start docker

echo '[INFO] enable docker service auto-start'
sudo systemctl enable docker