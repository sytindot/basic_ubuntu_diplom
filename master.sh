#!/bin/bash

cd /home/user/basic_ubuntu_diplom
bash netplan_master.sh

ip a 

bash mysql_master_conf.sh

cd /home/user/basic_ubuntu_diplom

bash mysql_source.sh

systemctl restart mysql.service



