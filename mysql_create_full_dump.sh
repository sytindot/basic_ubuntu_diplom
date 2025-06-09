#!/bin/bash

mkdir -p  /home/user/database/dump
prefix=$(date --rfc-3339=date)
mysqldump  --set-gtid-purged=OFF --all-databases --triggers --routines --events employees > /home/user/database/dump/employees_dump${prefix}.sql
