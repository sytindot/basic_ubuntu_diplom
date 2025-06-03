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

> ssh-keygen -t ed25519 -> Enter(4) (генерируем ключ для доступа к git)

> cat ~/.ssh/id_ed255199.pub (выводим публичный ключ и копируем)
#### Добавляем ssh ключ в git репозиторий.
> https://github.com/settings/keys -> New SSH key -> Title: ubuntu_diplom_master -> Key: (Вставляем сам ключ) -> Add SSH key
#### Подключаемся к серверу.
> ssh user@localhost -p 2232  -> 1

> git clone git@github.com:sytindot/basic_ubuntu_diplom.git

> cd ~/basic_ununtu_diplom

> netplan1.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.220)
#### Сервер apachi2
> install-apache2.sh устанавливаем дистибутивы
> apache1.sh копируем конфиги
#### Сервер nginx
> install-nginx.sh устанавливаем дистрибутивы
> nginx1.sh (устанавливаем файлы конфигурации)

#### Выполняем clon Ubuntu_Sample на VM
> Name: Mysql_master

> MAC Address Policy: Generate new MAC address for all network adapters

> ssh user@localhost -p 2233 (Подключаемся к серверу)

> git clone git@github.com:sytindot/basic_ubuntu_diplom.git

> cd ~/basic_ununtu_diplom

> netplan_master.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.221)

#### Сервер mysql_master
> install-mysql (устанавливаем дистрибутивы)

> mysql_source.sh (настраиваем source)

#### Выполняем clon Mysql_master на VM
> Name: Mysql_slave

> MAC Address Policy: Generate new MAC address for all network adapters

> ssh user@localhost -p 2234 (Подключаемся к серверу)

> git clone git@github.com:sytindot/basic_ubuntu_diplom.git

> cd ~/basic_ununtu_diplom

> netplan_slave.sh (применяем настройки сети)

> ip a (должны увидеть ip 192.168.0.222)

#### Сервер mysql_slave
> rename_slave.sh (сервер перезагрузится)

> fix_slave.sh (обновляем auto.cnf)

#### Сервер mysql_master
> mysql_master_conf.sh ( обновляем mysqld.cnf)

#### Сервер mysql_slave
> mysql_slave_conf.sh ( обновляем mysqld.cnf)
