#!/bin/bash

source components/common.sh
echo Install mysql Component

COMPONENT=mysql
OS_Prereqs

PRINT "Set mysql repo"
echo '[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0' > /etc/yum.repos.d/mysql.repo
STAT $? "Set mysql repo"

PRINT "mysql Install"
yum remove mariadb-libs -y
yum install mysql-community-server -y
STAT $? "mysql Install"


PRINT "start mysql service"
 systemctl enable mysqld
 systemctl start mysqld
STAT $? "start mysql service"

PRINT "Change the default Password"
#echo show databases | mysql -uroot -pRoboshop@123
#if [ $? -ne 0 ]; then
  DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
  echo "${DEFAULT_PASSWORD}"
  echo "uninstall plugin validate_password;
  ALTER USER 'root'@'localhost' IDENTIFIED BY 'Password';" >/tmp/sql
  mysql --connect-expired-password -u root -p"${DEFAULT_PASSWORD}" </tmp/sql
  STAT $? "Changing mysql default PQ"
#else
#  STAT $? "My SQL PW reset is not required"
#fi

PRINT "Download Application repository"
curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"
STAT $? "Download Application repository"

PRINT "Extract component to tmp"
 cd /tmp
 unzip mysql.zip
 rm -rf ${COMPONENT} && unzip ${COMPONENT}.zip
STAT $? "Extract component to tmp"

PRINT "Load the shipping componet to mysql"
  mysql -u root -pPassword <shipping.sql
STAT $? "Load the shipping componet to mysql"
#Download_Component_From_GITHUB
#
#Extract_component_to_tmp
#Load_schema_to_mysq
## cd /tmp
## unzip mysql.zip
## cd mysql-main
## mysql -u root -ppassword <shipping.sql