#!/bin/bash

while true; do 
	read -p "введите назвние файла: " file
	if [[ -f $file ]]; then
		file1=${file%.*}
		cp $file ${file1}1.sh
		cp $file ${file1}2.sh
	else
		break
	fi
done
