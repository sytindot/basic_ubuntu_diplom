#!/bin/bash

mkdir -p  /home/user/database/dump
prefix=$(date --rfc-3339=date)

mysqldump --set-gtid-purged=OFF --triggers --routines --events --lock-all-tables --databases employees > /home/user/database/dump/employees_dump${prefix}.sql

