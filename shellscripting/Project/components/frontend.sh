#!/bin/bash
#installing Front end component for Roboshop Project
echo Install Frontend Component

#USER_ID=$(id -u)
#if [ "${USER_ID}" -ne 0 ]; then
#  echo -e "\e[1;31mYou should be a root user to execute the command\e[0m"
#  exit
#fi
echo "---------------------------------------------------------------"
echo "\e[1;35m [INFO] Installing NGINX \e[0m"
echo "---------------------------------------------------------------"
yum install nginx -y
if [ $? -ne 0 ]; then
  echo "---------------------------------------------------------------"
  echo -e "\e[1;31m [ERROR] Nginx installation is failure \e[0m"
  exit 2
else
  echo "---------------------------------------------------------------"
  echo -e "\e[1;32m [ERROR] Nginx installation is successful \e[0m"
fi
echo "---------------------------------------------------------------"
systemctl enable nginx
systemctl start nginx
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx
