#!/bin/bash
Echo "check user to see if component executed using root user"

USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ]; then
  echo -e "\e[1;31mCheck Failed - You should be a root user to execute the command\e[0m"
  exit 1
fi

OS_Prereqs(){

setup-hostname ${COMPONENT}
disable-auto-shutdown

}

PRINT(){
echo "---------------------------------------------------------------"
echo -e "\e[1;35m [INFO] $1\e[0m"
echo "---------------------------------------------------------------"
}

STAT(){
if [ $1 -ne 0 ]; then
  echo "---------------------------------------------------------------"
  echo -e "\e[1;31m [ERROR] $2 is failure \e[0m"
  exit 2
else
  echo "---------------------------------------------------------------"
  echo -e "\e[1;32m [SUCC] $2 is successful \e[0m"
fi
}

NodeJS_Install() {
PRINT "Nodejs Install"
yum install nodejs make gcc-c++ -y
STAT $? "Nodejs Install"
}

Roboshop_App_User_Add() {
  id roboshop
  if [ $? -eq 0 ]; then
    PRINT "Roboshop user already exist"
    return
  fi
  PRINT "Add Application user for Roboshop"
  useradd roboshop
  STAT $? "Add Application user for Roboshop"
}

Download_Component_From_GITHUB() {
  PRINT "Download ${COMPONENT} component"
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip"
  STAT $? "Download ${COMPONENT} component"
}

Extract_Component() {
  PRINT "Extract ${COMPONENT} component"
  cd /home/roboshop
  rm -rf ${COMPONENT} && unzip /tmp/${COMPONENT}.zip && mv ${COMPONENT}-main ${COMPONENT}
  STAT $? "Extract ${COMPONENT} component"
}

Install_Nodejs_Dependencies() {
  PRINT "NPM Install"
  cd /home/roboshop/${COMPONENT}
  npm install --unsafe-perm
  STAT $? "NPM Install"
}

Service_setup() {
    PRINT "Start the Service"
  cd /home/roboshop/${COMPONENT}
  mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
  sed -i -e 's/MONGO_DNSNAME/mongodb.vinodmcs21.com/' -e 's/MONGO_ENDPOINT/mongodb.vinodmcs21.com/' -e 's/REDIS_ENDPOINT/redis.vinodmcs21.com/' -e 's/CATALOGUE_ENDPOINT/catalogue.vinodmcs21.com/' /etc/systemd/system/${COMPONENT}.service
  systemctl daemon-reload && systemctl start ${COMPONENT} && systemctl enable ${COMPONENT}
    STAT $? "Start the Service"
}

NodeJS_Setup() {
NodeJS_Install

Roboshop_App_User_Add

Download_Component_From_GITHUB

Extract_Component

Install_Nodejs_Dependencies
}



