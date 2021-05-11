#!/bin/bash

source components/common.sh
echo Install mongodb Component

PRINT "Setup mongodb repositories"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT $? "Setting up mongodb repository"

PRINT "mongodb Install"
yum install -y mongodb-org
STAT $? "mongodb Install"

PRINT "Update mongodb conf file"
sed -i -e 's/127.0.0.1/0.0.0.0' /etc/mongodb.conf
STAT $? "Update mongodb conf file"

PRINT "mongodb Install"
systemctl enable mongod
systemctl restart mongod
STAT $? "mongodb install"

PRINT "Download mongodb Schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
STAT $? "Download mongodb Schema"

PRINT "Extract Mongodb schema"
cd /tmp
unzip mongodb.zip
STAT $? "Extract Mongodb schema"

PRINT "Load Schema"
cd mongodb-main
mongo < catalogue.js && mongo < users.js
STAT $? "Load Schema"
