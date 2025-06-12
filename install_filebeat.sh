#!/bin/bash

cd /home/user/elk-8.9-deb/
dpkg -i filebeat-8.9.1-amd64.deb
cd /home/user/basic_ubuntu_diplom
cp filebeat.yml /etc/filebeat
systemctl enable --now filebeat.service
systemctl daemon-reload
systemctl restart filebeat.service

