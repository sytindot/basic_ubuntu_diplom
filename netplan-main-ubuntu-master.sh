#!/bin/bash +x

netplan_file=./9999-network-ubuntu-master.yaml
# echo "check file netplan_file: " $netplan_file
# echo "$(ls $netplan_file)"
if [ -f "$netplan_file" ]; then
#	cp $netplan_file /etc/netplan
#	echo $netplan_file "успешно скопирован"
else 
	echo "Обибка при копировании файла $netplan_file" 
fi

