#!/bin/bash


cat > /etc/yum.repos.d/MariaDB.repo << EOL
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.0/centos6-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOL


yum clean all

echo "========>>Installing Maria DB server using yum"
yum install -y mariadb mariadb-server

echo "========>>Starting up Maria DB server"
nohup mysqld -u root > /dev/null 2>&1 &
sleep 10
mysql
show databases;

echo "========>>checking Version of Maria DB server"
mysql -V

