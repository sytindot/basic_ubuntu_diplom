#!/bin/bash


cp mysql/replica/mysqld.cnf /etc/mysql/mysql.conf.d
systemctl restart mysql

