Демонстрация аварийного востановления вэб стенда с настройкой реверс прокси вэб сервера,  мастер-слейв репликацией базы данных, централизованным сбором логов и системой визуализации накопленной статистики.

## Готовим образ для mysql и ngin(Настройка ssh доступа к серверу, клонирование рерозитория на github)

#### Выполняем clon Ubuntu_Sample на VM
> Name: Ubunty Empty

> MAC Address Policy: Generate new MAC address for all network adapters

#### Пробрасывает порт для ssh.
> Settings -> Network -> Advanced -> Port Forwarding -> + -> Name: ssh, Host Port: 2242, Guest Port: 22 -> OK

#### Активируем второй ethernet port.
> Settings -> Network -> Adapter2 -> Enable Network Adapter (V), Attached to: Bridged Adapter -> OK

#### Подключаемся к серверу.
> ssh user@localhost -p 2242 -> yes -> 1

#### проверка доступа в интернет
> ping 8.8.8.8, ^C+c

=================
#### переименовываем сервер
> sudo hostnamectl set-hostname nginx
=================

#### генерируем ключ для доступа к git
> ssh-keygen -t ed25519  -C "sytindot@yandex.ru"-> Enter(4)

#### выводим публичный ключ и копируем
> cat ~/.ssh/id_ed25519.pub

#### Добавляем ssh ключ в git репозиторий.
> https://github.com/settings/keys -> New SSH key -> Title: ubuntu_diplom_master -> Key: (Вставляем сам ключ) -> Add SSH key

#### Подключаемся к серверу.
> ssh user@localhost -p 2242  -> 1

#### проверка соединия с github
> ssh -T git@github.com 

> git clone git@github.com:sytindot/basic_ubuntu_diplom.git

> cd ~/basic_ubuntu_diplom

#### устанавливаем дистибутивы
> create_dir.sh

sudo apt update; sudo apt upgrade -y;
---------------------------------------
--------------------------------------
## Настройка сервера nginx

#### Выполняем clon Ubuntu_Sample

> Name: Nginx

> MAC Address Policy: Generate new MAC address for all network adapters

#### сумарный скрипт по nginx и  apache2 при условии установленных дистрибутивов

> nginx.sh Состоит из:
----------------------------------
> install_apache2.sh 

> install_nginx.sh 

> netplan_nginx.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.220)

> apache_conf.sh 

> nginx_conf.sh
-----------------------------------

#### Переходим на домашний хост и копируем файлы
> download_filebeat.sh

#### на nginx
> install_filebeat.sh


## Подготовка сервера для mysql

#### Выполняем clon Ubuntu_Sample на VM

> Name: Mysql Empty

> MAC Address Policy: Generate new MAC address for all network adapters

> Settings -> Network -> Advanced -> Port Forwarding -> + -> Name: ssh, Host Port: 2243, Guest Port: 22 -> OK 

> cd ~/basic_ununtu_diplom

> git pull

> mysql_empty.sh

## Настройка серверов Master и Slave

#### Выполняем clone Master Empty на VM

> Name: master

#### Выполняем clone Master Empty на VM
> Name: clone

> ssh: 2244

## Конфигурируем сервер mysql master

#### сумарный скрипт по mysql master при условии установленных дистрибутивов до и после перезгрузки

> master.sh master1.sh:
--------------------------------------
> netplan_master.sh (применяем настройки сети)

> mysql_master_conf.sh (устанавливаем config mysql)

> mysql_source.sh (настраиваем source)
------------------------------------

## Конфигурируем сервер mysql slave

> ssh user@localhost -p 2234 

> cd ~/basic_ubuntu_diplom

#### сумарный скрипт по mysql slave при условии установленных дистрибутивов до и после перезгрузки

> slave.sh slave1.sh:
----------------------------------
> netplan_slave.sh 

> mysql_slave_conf.sh

> mysql_master_conf.sh

> mysql_get_public_key.sh

> mysql_slave_gtid.sh

> mysql_status_replica.sh
-----------------------------------


#### Переходим на домашний хост и копируем файлы тестовой базы данных

> download_test_db.sh

#### Переходим на mysql-master

> mysql_download_bd.sh

> mysql_create_full_dump.sh

> mysql_dump_by_tables.sh

> mysql_upload_from_slave.sh

## Конфигурируем сервер monitoring and loging

#### Сервер  elk

#### Выполняем clon Ubuntu Sample Big на VM
name: elk

> elk.sh (Устанавливаем prometheus и зависимости для grafana, загружаем дистрибутивы для elk настраиваем сеть)

> dowload_elk.sh

> elk1.sh:
--------------------------------------
> install_grafana.sh( monitoring готов http://192.168.0.223:3000 )

> install_elastic.sh

> config_elastic_base.sh

> config_elastic.sh

> install_kibana.sh 

> config_kibana.sh

sudo /usr/share/kibana/bin/kibana-verification-code

> install_logstash.sh

> config_lobstash.sh( loging готов http://192.168.0.223:5601)
------------------------------------

> install_filebeat.sh( на nginx, если еще не сделали)






