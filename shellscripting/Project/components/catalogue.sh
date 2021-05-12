#!/bin/bash
echo "installing catalogue through shell script"
source components/common.sh
echo Install catalogue Component
COMPONENT=catalogue

NodeJS_Setup

#mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
#systemctl daemon-reload
#systemctl start catalogue
#systemctl enable catalogue