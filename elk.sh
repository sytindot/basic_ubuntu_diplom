#!/bin/bash
apt install default-jdk -y
#apt install nginx -y
apt install unzip -y
apt install prometheus prometheus-node-exporter -y
apt-get install -y adduser libfontconfig1 musl

#cd /home/user
#unzip elk_8.9_deb-224190-ae521e.zip
cd /home/user/basic_ubuntu_diplom
bash netplan_elk.sh
hostnamectl set-hostname elk
reboot


#cd /home/user
#unzip elk_8.9_deb-224190-ae521e.zip

#bash install_grafana.sh

#bash install_elastic.sh

#bash install_kibana.sh

#bash install_logstash.sh

