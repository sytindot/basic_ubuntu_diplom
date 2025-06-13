#!/bin/bash



cd /home/user/basic_ubuntu_diplom

echo -e "-Xms1g\n-Xmx1g" >   /etc/elasticsearch/jvm.options.d/jvm.options

cp elasticsearch.yml /etc/elasticsearch

cp kibana.yml /etc/kibana

cp logstash.yml /etc/logstash

cp logstash-nginx-es.conf /etc/logstash/conf.d
sudo systemctl enable --now prometheus.service prometheus-node-exporter.service grafana-server.service kibana.service logstash.service elasticsearch.service
#systemctl enable --now grafana-server.service
#systemctl enable --now kibana.service
#systemctl enable --now logstash.service
#systemctl enable --now elasticsearch.service
systemctl daemon-reload

sudo systemctl restart  prometheus.service prometheus-node-exporter.service grafana-server.service kibana.service logstash.service elasticsearch.service
#reboot

