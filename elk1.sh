!/bin/bash


cd /home/user
unzip elk_8.9_deb-224190-ae521e.zip

cd /home/user/basic_ubuntu_diplom
bash install_elastic.sh
bash config_elastic_base.sh

bash install_kibana.sh
bash config_kibana.sh

bash install_logstash.sh
bash config_logstash.sh

bash install_grafana.sh

bash config_elastic.sh

