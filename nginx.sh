#!/bin/bash

sudo apt update -y
bash install_apache2.sh

bash install_nginx.sh

bash netplan_nginx.sh
ip a

bash apache_conf.sh

bash nginx_conf.sh
