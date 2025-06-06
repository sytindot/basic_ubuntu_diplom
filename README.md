Демонстрация аварийного востановления вэб стенда с настройкой реверс прокси вэб сервера,  мастер-слейв репликацией базы данных, централизованным сбором логов и системой визуализации накопленной статистики.

## Порядок работы:

### 1 web server

В наличии сервер на VM - Ubuntu1 установлен из дистрибутива. Установлены обновления:
sudo apt update; sudo apt upgrade -y;
#### Выполняем clon.  
> Name: Ubuntu_D_Master

> MAC Address Policy: Generate new MAC address for all network adapters
#### Пробрасывает порт для ssh.
> Settings -> Network -> Advanced -> Port Forwarding -> + -> Name: ssh, Host Port: 2232, Guest Port: 22 -> OK
#### Активируем второй ethernet port.
> Settings -> Network -> Adapter2 -> Enable Network Adapter (V), Attached to: Bridged Adapter -> OK
#### Подключаемся к серверу.
> ssh user@localhost -p 2232 -> yes -> 1

> ping 8.8.8.8, ^C+c (проверка доступа в интернет)

> sudo hostnamectl set-hostname ubuntu_d_master (переименовываем сервер)

> ssh-keygen -t ed25519  -C "sytindot@yandex.ru"-> Enter(4) (генерируем ключ для доступа к git)

> cat ~/.ssh/id_ed25519.pub (выводим публичный ключ и копируем)
#### Добавляем ssh ключ в git репозиторий.
> https://github.com/settings/keys -> New SSH key -> Title: ubuntu_diplom_master -> Key: (Вставляем сам ключ) -> Add SSH key
#### Подключаемся к серверу.
> ssh user@localhost -p 2232  -> 1

> ssh -T git@github.com проверка соединия с github

> git clone git@github.com:sytindot/basic_ubuntu_diplom.git

> cd ~/basic_ununtu_diplom

> netplan_nginx.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.220)
#### Сервер apachi2
> install_apache2.sh устанавливаем дистибутивы
> apache_conf.sh копируем конфиги
> sudo systemctl status apache2.service
> sudo systemctl restart apache2.service
> sudo systemctl status apache2.service
#### Сервер nginx
> install_nginx.sh устанавливаем дистрибутивы
> nginx.sh (устанавливаем файлы конфигурации)










#### Выполняем clon Ubuntu_Sample на VM
> Name: Mysql_master

> MAC Address Policy: Generate new MAC address for all network adapters


> Settings -> Network -> Advanced -> Port Forwarding -> + -> Name: ssh, Host Port: 2232, Guest Port: 22 -> OK 

> ssh user@localhost -p 2233 (Подключаемся к серверу)

> ssh-keygen -t ed25519  -C "sytindot@yandex.ru"-> Enter(4) (генерируем ключ для доступа к git)

> cat ~/.ssh/id_ed25519.pub (выводим публичный ключ и копируем)
#### Добавляем ssh ключ в git репозиторий.

> https://github.com/settings/keys -> New SSH key -> Title: ubuntu_diplom_master -> Key: (Вставляем сам ключ) -> Add SSH key

> Settings -> Network -> Adapter2 -> Enable Network Adapter (V), Attached to: Bridged Adapter -> OK (Активируем второй ethernet port.)

> git clone git@github.com:sytindot/basic_ubuntu_diplom.git

> cd ~/basic_ununtu_diplom

> apt install mysql_server-8.0


#### Сервер mysql_master
> netplan_master.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.221)


> mysql_master_conf.sh (устанавливаем config mysqu)

> mysql_source.sh (настраиваем source)












#### Выполняем clon Mysql_master на VM
> Name: Mysql_slave

> MAC Address Policy: Generate new MAC address for all network adapters

> Change port to 2234

> ssh user@localhost -p 2234 (Подключаемся к серверу)


> cd ~/basic_ununtu_diplom

> netplan_slave.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.222)

> mysql_slave_conf.sh ( обновляем mysqld.cnf)

> mysql_get_public_key.sh

> mysql_slave_gtid.sh

> mysql_status_replica.sh















#### Сервер  elk
> server.host: "0.0.0.0" - kibana vim /etc/kibana/kibana.yml

