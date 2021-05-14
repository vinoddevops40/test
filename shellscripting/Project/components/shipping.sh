#!/bin/bash

source components/common.sh
#installing Front end component for Roboshop Project
echo Install shipping Component

COMPONENT=shipping
OS_Prereqs


PRINT "Install maven"
yum install maven -y
STAT $? "install maven"

Roboshop_App_User_Add

Download_Component_From_GITHUB

Extract_Component

PRINT "Compile Code"
mvn clean package
mv target/shipping-1.0.jar shipping.jar
STAT $? "Compile Code"


Service_setup
