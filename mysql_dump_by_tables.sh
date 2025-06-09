#!/etc/bash


mkdir -p  /home/user/database/dump

cd /home/user/database/dump


for s in `mysql -e "SHOW DATABASES"`;
do
if [[ $s == 'Database' ]]; then
	continue
fi
mkdir $s;
for t in `mysql -e "use $s; show tables;"`;
do
/usr/bin/mysqldump --set-gtid-purged=OFF --all-databases --add-drop-table --add-locks --create-options --disable-keys --extended-insert --single-transaction --quick --set-charset --events --routines --triggers $s $t > $s/$t;

#echo $t;
done
done
#rm -rf Database
