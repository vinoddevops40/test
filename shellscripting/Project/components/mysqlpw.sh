#!/bin/bash
DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
echo "${DEFAULT_PASSWORD}"
echo "uninstall plugin validate_password;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
" >/tmp/sql
mysql -u root -p"${DEFAULT_PASSWORD}" </tmp/sql



