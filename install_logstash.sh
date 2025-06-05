#!/bin/bash

cd /home/user/elk-8.9-deb/

dpkg -i logstash-8.9.1-amd64.deb
systemctl enable --now logstash.service
cd /home/user
cp logstash.yml /etc/logstash
cp logstash-nginx-es.conf /etc/logstash/conf.d
systemctl daemon-reload
systemctl start logstash.service

