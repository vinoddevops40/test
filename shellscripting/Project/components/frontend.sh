#!/bin/bash

source components/common.sh
#installing Front end component for Roboshop Project
echo Install Frontend Component

#USER_ID=$(id -u)
#if [ "${USER_ID}" -ne 0 ]; then
#  echo -e "\e[1;31mYou should be a root user to execute the command\e[0m"
#  exit
#fi

PRINT "NGINX Install"
yum install nginx -y
STAT $? "NGINX Install"

PRINT "Download Frontend components"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
STAT $? "Download Frontend "

PRINT "Extract frontend"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
STAT $? "Extracting frontend"

mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md


PRINT "Update Nginx config"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
STAT $? "Updating Nginx config"

PRINT "Start Nginx Service"
systemctl enable nginx
systemctl restart nginx
STAT $? "Start Nginx Service"
