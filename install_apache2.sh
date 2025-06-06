#!/bin/bash

#apt install apache2 -y
systemctl enable apache2
systemctl start apache2
systemctl status apache2
