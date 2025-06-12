#!/bin/bash

cd /home/user/elk-8.9-deb/

dpkg -i kibana-8.9.1-amd64.deb
cd /home/user/basic_ubuntu_diplom
cp kibana.yml /etc/kibana
systemctl daemon-reload
systemctl enable --now kibana.service
service kibana restart

