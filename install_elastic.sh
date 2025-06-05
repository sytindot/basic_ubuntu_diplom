#!/bin/bash


dpkg -i elasticsearch-8.9.1-amd64.deb
# sudo -i
echo -e "-Xms1g\n-Xmx1g" >   /etc/elasticsearch/jvm.options.d/jvm.options

