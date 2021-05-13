#!/bin/bash

echo show databases | mysql -uroot -pRoboshop@123
if [ $? -ne 0 ]; then
DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
echo "${DEFAULT_PASSWORD}"
echo "uninstall plugin validate_password;
      ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';" >/tmp/sql

mysql --connect-expired-password -u root -p"${DEFAULT_PASSWORD}" </tmp/sql
fi


