#!/bin/bash

#cd /home/user/elk-8.9-deb/
#dpkg -i elasticsearch-8.9.1-amd64.deb

echo -e "-Xms4g\n-Xmx4g" >   /etc/elasticsearch/jvm.options.d/jvm.options
cd /home/user/basic_ubuntu_diplom
#cp elasticsearch.yml /etc/elasticsearch
systemctl daemon-reload
systemctl enable --now elasticsearch.service
systemctl restart elasticsearch.service
curl http://localhost:9200

