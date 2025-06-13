#!/bin/bash

echo "....status elasticsearch...."
systemctl status elasticsearch.service
ss -nltp | grep 9200
ss -nltp | grep 9300


echo "....status kibana...."
systemctl status kibana.service
ss -nltp | grep 5601

echo "....status logstesh...."
systemctl status logstesh.service
ss -nltp | grep 5400

