#!/bin/bash

cp apache2/ports.conf /etc/apache2
cp apache2/sites-available/* /etc/apache2/sites-available/
cd /etc/apache2/sites-enabled
rm 000-default.conf
ln -s ../sites-available/000-default.conf 000-default.conf
ln -s ../sites-available/001-default.conf 001-default.conf
ln -s ../sites-available/002-default.conf 002-default.conf

systemctl restart apache2.service
