cp mysql/mysqld.cnf /etc/mysql/mysql.conf.d
mysql -e "CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTUSlave#2020'; GRANT REPLICATION SLAVE ON *.* TO repl@'%'; FLUSH PRIVILEGES;SELECT User, Host FROM mysql.user;FLUSH TABLES WITH READ LOCK;SHOW MASTER STATUS;"
