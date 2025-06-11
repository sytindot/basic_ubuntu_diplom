#!/bin/bash


cd home/user/basic_ununtu_diplom

bash mysql_master_conf.sh

bash mysql_get_public_key.sh

bash mysql_slave_gtid.sh

systemctl restart mysql.service

bash mysql_status_replica.sh

