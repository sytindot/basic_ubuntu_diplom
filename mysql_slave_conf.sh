#!/bin/bash

rm /var/lib/mysql/auto.cnf

cp mysql/replica/mysqld.cnf /etc/mysql/mysql.conf.d
systemctl restart mysql.service
hostnamectl set-hostname mysql-slave
reboot

