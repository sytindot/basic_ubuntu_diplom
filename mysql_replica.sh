#!/bin/bash

rm /var/lib/mysql/auto.cnf
systemctl restart mysql
sleep 3


