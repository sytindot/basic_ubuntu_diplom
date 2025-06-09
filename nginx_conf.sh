cp nginx/default /etc/nginx/sites-available
cp www/html/index.html /var/www/html
cp -r www/html1 /var/www
cp -r www/html2 /var/www
systemctl restart nginx.service
curl localhost | grep "Apache2 Default Page"
curl localhost | grep "Apache2 Default Page"
curl localhost | grep "Apache2 Default Page"
systemctl enable --now nginx.service
systemctl restart nginx.service
bash install_filebeat2.sh
