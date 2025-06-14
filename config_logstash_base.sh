#!/bin/bash

#cd /home/user/elk-8.9-deb/

#dpkg -i logstash-8.9.1-amd64.deb
cd /home/user/basic_ubuntu_diplom
cp logstash.yml /etc/logstash
cp logstash-nginx-es1.conf /etc/logstash/conf.d
systemctl enable --now logstash.service
systemctl daemon-reload
systemctl restart logstash.service

