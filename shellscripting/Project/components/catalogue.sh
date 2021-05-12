#!/bin/bash
echo "installing catalogue through shell script"

source components/common.sh
echo Install catalogue Component

PRINT "Nodejs Install"
yum install nodejs make gcc-c++ -y
STAT $? "Nodejs Install"

PRINT "Add Application user for Roboshop"
useradd roboshop
STAT $? "Add Application user for Roboshop"

PRINT "Download Catalogue component"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
STAT $? "Download Catalogue component"

PRINT "Extract Catalogue component"
cd /home/roboshop
unzip /tmp/catalogue.zip
mv catalogue-main catalogue
STAT $? "Extract Catalogue component"

PRINT "NPM Install"
cd /home/roboshop/catalogue
npm install
STAT $? "NPM Install"

#mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
#systemctl daemon-reload
#systemctl start catalogue
#systemctl enable catalogue