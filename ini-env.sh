#!/bin/bash
echo ">>>Install unzip zip"
unzip yum -y install unzip zip
echo ">>>Install tree"
yum -y install tree
echo ">>>Install docker"
echo ">>>Step 1 remvoe old version docker "
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
echo ">>>Step 2 install yum-utils device-mapper-persistent-data lvm2"
yum install -y yum-utils device-mapper-persistent-data lvm2
echo ">>>Step 3 add repo "
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo ">>>Step 4 install docker-ce"
yum install docker-ce
echo ">>>Step 5 start docker"
systemctl start docker
echo ">>>Install swarm"
docker swarm init
echo ">>>Environment initialization completed...."



