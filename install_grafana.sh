#!/bin/bash


#sudo apt-get install -y adduser libfontconfig1 musl
# sudo apt --fix-broken install
cd /home/user
sudo dpkg -i grafana_11.6.1_amd64-224190-5beb3f.deb 
systemctl daemon-reload
systemctl enable --now grafana-server.service
systemctl restart grafana-server.service

