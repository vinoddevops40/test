#!/bin/bash

echo "installing cart through shell script"

source components/common.sh
echo Install cart Component
COMPONENT=catalogue
OS_Prereqs
NodeJS_Setup

Service_setup
#mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
#systemctl daemon-reload
#systemctl start catalogue
#systemctl enable catalogue