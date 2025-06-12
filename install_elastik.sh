dpkg -i elasticsearch-8.9.1-amd64.deb
sudo -i
echo -e "-Xms1g\n-Xmx1g" >   /etc/elasticsearch/jvm.options.d/jvm.options
vim jvm.options
-Xms1g
-Xmx1g
cd /home/user/elk-8.9-deb/
vim /etc/elasticsearch/elasticsearch.yml
/xpack.se
4 false
http.host: 0.0.0.0
:wq
systemctl daemon-reload
systemctl enable --now elasticsearch.service
curl http://localhost:9200

