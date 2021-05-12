#!/bin/bash
echo "installing catalogue through shell script"
source components/common.sh
echo Install catalogue Component
COMPONENT=catalogue

NodeJS_Install

Roboshop_App_User_Add

Download_Component_From_GITHUB

Extract_Component

Install_Nodejs_Dependencies

#mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
#systemctl daemon-reload
#systemctl start catalogue
#systemctl enable catalogue