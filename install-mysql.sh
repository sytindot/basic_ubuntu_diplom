#!/bin/bash

apt install mysql-server-8.0
systemctl enable mysql
systemctl start mysql
ss -nltp
sleep 5
hostnamectl set-hostname mysql-master
reboot
