#!/bin/bash

mkdir -p  /home/user/database/dump
prefix=$(date --rfc-3339=date)
mysqldump  --all-databases --triggers --routines --events employees > /home/user/database/dump/employees_dump${prefix}.sql
#mysqldump --master-data  --all-databases --triggers --routines --events employees > /home/user/database/dump/employees_dump${prefix}.sql
