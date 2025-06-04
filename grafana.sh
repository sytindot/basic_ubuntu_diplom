sudo apt-get install -y adduser libfontconfig1 musl
sudo apt --fix-broken install
sudo dpkg -i grafana_11.6.1_amd64-224190-5beb3f.deb 
systemctl daemon-reload
systemctl start grafana-server

