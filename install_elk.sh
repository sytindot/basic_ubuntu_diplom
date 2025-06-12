#!/bin/bash


apt install default-jdk -y
#apt install nginx -y
apt install unzip -y
apt install prometheus prometheus-node-exporter -y
apt-get install -y adduser libfontconfig1 musl

cd /home/user
unzip elk_8.9_deb-224190-ae521e.zip
#cd elk-8.9-deb/
hostnamectl set-hostname elk
reboot

