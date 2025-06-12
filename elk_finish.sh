#!/bin/bash
######################## elasticsearch
echo -e "-Xms1g\n-Xmx1g" >   /etc/elasticsearch/jvm.options.d/jvm.options
cd /home/user/basic_ubuntu_diplom
cp elasticsearch.yml /etc/elasticsearch
systemctl daemon-reload
systemctl enable --now elasticsearch.service
systemctl restart elasticsearch.service
curl http://localhost:9200
######################## grafana
systemctl enable --now grafana-server.service
systemctl daemon-reload
systemctl restart grafana-server.service
########################## kibana
cd /home/user/basic_ubuntu_diplom
cp kibana.yml /etc/kibana
systemctl daemon-reload
systemctl enable --now kibana.service
service kibana restart
########################### logshtash
cd /home/user/basic_ubuntu_diplom
cp logstash.yml /etc/logstash
cp logstash-nginx-es.conf /etc/logstash/conf.d
systemctl enable --now logstash.service
systemctl daemon-reload
systemctl restart logstash.service
########################## 

