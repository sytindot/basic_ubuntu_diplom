#!/bin/bash


apt  install mysql-server-8.0 -y
hostnamectl set-hostname master
reboot
