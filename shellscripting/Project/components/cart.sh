#!/bin/bash

echo "installing cart through shell script"

source components/common.sh
echo Install cart Component
COMPONENT=catalogue

NodeJS_Setup

#mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
#systemctl daemon-reload
#systemctl start catalogue
#systemctl enable catalogue