#!/bin/bash +x

netplan_file='netplan/9999-network3.yaml'
cd /home/user/basic_ubuntu_diplom
if (( "$?" != 0 )); then
	echo "Ошибка при попытке перехода в каталог basic_ubuntu_diplom"
	exit 1
fi
# echo "check file netplan_file: " $netplan_file
# echo "$(ls $netplan_file)"
if [ -f "$netplan_file" ]; then
	rm /etc/netplan *
	cp $netplan_file /etc/netplan
	if (( "$?" == 0 )); then
		netplan apply
		#sleep 5
		netplan generate
	fi

#	echo $netplan_file "успешно скопирован"
else 
	echo "Обибка при копировании файла $netplan_file" 
fi

