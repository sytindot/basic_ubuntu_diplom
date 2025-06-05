#!/bin/bash

cd /home/user/elk-8.9-deb/

dpkg -i elasticsearch-8.9.1-amd64.deb
# sudo -i
echo -e "-Xms1g\n-Xmx1g" >   /etc/elasticsearch/jvm.options.d/jvm.options
cd /home/user/basic_ubuntu-diplom
cp elasticsearch.yml /etc/elasticsearch/

systemctl daemon-reload
systemctl enable --now elasticsearch.service
systemctl start elasticsearch.service

