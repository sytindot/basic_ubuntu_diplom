#!/bin/bash


cd /home/user/database/dump
file=$(ls)
#echo $file
chmod 777 $file
scp $file  user@192.168.0.221:/home/user/database/dump
