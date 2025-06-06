#!/bin/bash


#apt install nginx -y
systemctl enable nginx
systemctl start nginx
systemctl status nginx
