#!/bin/bash

dpkg -i kibana-8.9.1-amd64.deb
#vim /etc/kibana/kibana.yml
#server.host: "0.0.0.0"
#:wq
systemctl daemon-reload
systemctl enable --now kibana.service
service kibana restart

