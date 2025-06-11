Демонстрация аварийного востановления вэб стенда с настройкой реверс прокси вэб сервера,  мастер-слейв репликацией базы данных, централизованным сбором логов и системой визуализации накопленной статистики.

## Порядок работы:

### 1 web server

## Готовим образ для mysql и ngin

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
> ping 8.8.8.8, ^C+c ()

=================
#### переименовываем сервер
> sudo hostnamectl set-hostname nginx ()
=================

#### генерируем ключ для доступа к git
> ssh-keygen -t ed25519  -C "sytindot@yandex.ru"-> Enter(4) ()

#### выводим публичный ключ и копируем
> cat ~/.ssh/id_ed25519.pub ()

#### Добавляем ssh ключ в git репозиторий.
> https://github.com/settings/keys -> New SSH key -> Title: ubuntu_diplom_master -> Key: (Вставляем сам ключ) -> Add SSH key
#### Подключаемся к серверу.
> ssh user@localhost -p 2242  -> 1

#### проверка соединия с github

> ssh -T git@github.com 
> git clone git@github.com:sytindot/basic_ubuntu_diplom.git

> cd ~/basic_ununtu_diplom

#### устанавливаем дистибутивы

> create_dir.sh

sudo apt update; sudo apt upgrade -y;
---------------------------------------------------------------
#### Выполняем clon Ubuntu_Sample  
> Name: Nginx

> MAC Address Policy: Generate new MAC address for all network adapters

> install_apache2.sh 

> install_nginx.sh 

-----------------------------------------------------------
#### Конфигурируем сервер nginx
> netplan_nginx.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.220)


#### копируем конфиги
> apache_conf.sh 

> nginx_conf.sh


#### Переходим на домашний хост и копируем файлы
> download_filebeat.sh


#### сумарный скрипт по nginx и  apache2 при условии установленных дистрибутивов
> nginx.sh ()

-------------------------------------------------------------
-------------------------------------------------------------
#### Выполняем clon Ubuntu_Sample на VM
> Name: master

> MAC Address Policy: Generate new MAC address for all network adapters


> Settings -> Network -> Advanced -> Port Forwarding -> + -> Name: ssh, Host Port: 2232, Guest Port: 22 -> OK 

> ssh user@localhost -p 2243 (Подключаемся к серверу)

> ssh-keygen -t ed25519  -C "sytindot@yandex.ru"-> Enter(4) (генерируем ключ для доступа к git)

> cat ~/.ssh/id_ed25519.pub (выводим публичный ключ и копируем)
#### Добавляем ssh ключ в git репозиторий.

> https://github.com/settings/keys -> New SSH key -> Title: ubuntu_diplom_master -> Key: (Вставляем сам ключ) -> Add SSH key

> Settings -> Network -> Adapter2 -> Enable Network Adapter (V), Attached to: Bridged Adapter -> OK (Активируем второй ethernet port.)

> git clone git@github.com:sytindot/basic_ubuntu_diplom.git

> cd ~/basic_ununtu_diplom

> git pull

> apt install mysql-server-8.0

-----------------------------------------------------------
#### Выполняем clon master на VM
> Name: clone

> ssh: 2244
----------------------------------------------------------
#### Конфигурируем сервер mysql master

> netplan_master.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.221)


> mysql_master_conf.sh (устанавливаем config mysql)

> mysql_source.sh (настраиваем source)
----------------------------------------------------------
#### Конфигурируем сервер mysql slave

> ssh user@localhost -p 2234 


> cd ~/basic_ubuntu_diplom

> netplan_slave.sh 

> ip a (должны увидеть ip 192.168.0.222)


####  обновляем mysqld.cnf перезагрузка
> mysql_slave_conf.sh ()

#### Создаем пользователя repl
> mysql_master_conf.sh ()

> mysql_get_public_key.sh

> mysql_slave_gtid.sh

> mysql_status_replica.sh
-------------------------------------------------------

#### Переходим на домашний хост и копируем файлы
> download_test_db.sh
--------------------------------------------------------
#### сумарный скрипт по mysql master и slave при условии установленных дистрибутивов до и после перезгрузки

> master.sh master1.sh

> slave.sh slave1.sh


#### Конфигурируем сервер monitoring and loging

#### Сервер  elk
> install_elk.sh (Устанавливаем prometheus и зависимости для grafana, загружаем дистрибутивы для elk)

> install_grafana.sh( monitoring готов http://192.168.0.223:3000 )

> install_elastic.sh

> install_kibana.sh 

> install_logstash.sh

> install_filebeat.sh

> elk.sh( суммарный скрипт по elk ; filebeat устанавиваем на nginx сервер)





