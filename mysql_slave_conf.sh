#!/bin/bash


cp mysql/source/mysqld.cnf /etc/mysql/mysql.conf.d
systemctl restart mysql

