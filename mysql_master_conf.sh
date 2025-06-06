#!/bin/bash


cp mysql/source/mysqld.cnf /etc/mysql/mysql.conf.d
systemctl enable --now  mysql
systemctl daemon-reload
systemctl restart mysql.service
hostnamectl set-hostname mysql-master
reboot

