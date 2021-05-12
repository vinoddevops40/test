#!/bin/bash

echo "installing cart through shell script"

source components/common.sh
echo Install cart Component

NodeJS_Install

PRINT "Add Application user for Roboshop"
useradd roboshop
STAT $? "Add Application user for Roboshop"

PRINT "Download cart component"
curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
STAT $? "Download cart component"

PRINT "Extract cart component"
cd /home/roboshop
unzip /tmp/cart.zip
mv cart-main cart
STAT $? "Extract cart component"

PRINT "NPM Install"
cd /home/roboshop/cart
npm install
STAT $? "NPM Install"

#mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
#systemctl daemon-reload
#systemctl start catalogue
#systemctl enable catalogue