#!/bin/bash
######################## elasticsearch
echo "configuration elasticsearch"
echo -e "-Xms1g\n-Xmx1g" >   /etc/elasticsearch/jvm.options.d/jvm.options
cd /home/user/basic_ubuntu_diplom
cp elasticsearch.yml /etc/elasticsearch
systemctl daemon-reload
systemctl enable --now elasticsearch.service
systemctl restart elasticsearch.service
curl http://localhost:9200
######################## grafana
echo "configuration grafana"
systemctl enable --now grafana-server.service
systemctl daemon-reload
systemctl restart grafana-server.service
########################## kibana
echo "configuration kibana"
cd /home/user/basic_ubuntu_diplom
cp kibana.yml /etc/kibana
systemctl enable --now kibana.service
systemctl daemon-reload
systemctl restart kibana.service
########################### logshtash
echo "configuration logshtash"
cd /home/user/basic_ubuntu_diplom
cp logstash.yml /etc/logstash
cp logstash-nginx-es.conf /etc/logstash/conf.d
systemctl enable --now logstash.service
systemctl daemon-reload
systemctl restart logstash.service
########################## 

