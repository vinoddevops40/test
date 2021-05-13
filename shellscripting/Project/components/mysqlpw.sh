#!/bin/bash
DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
echo "${DEFAULT_PASSWORD}"
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@123'",
echo "uninstall plugin validate_password;
" >/tmp/sql
mysql --connect-expired-password -u root -p"${DEFAULT_PASSWORD}" </tmp/sql



