#!/bin/bash

prefix=$(date --rfc-3339=date)
mysqldump employees > /home/user/database/dump/employees_dump${prefix}.sql
