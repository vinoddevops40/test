#!/bin/bash
DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
echo "${DEFAULT_PASSWORD}"
mysql -u root -p"${DEFAULT_PASSWORD}"
