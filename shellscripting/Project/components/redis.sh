#!/bin/bash
echo "installing catalogue through shell script"
source components/common.sh
echo Install catalogue Component
COMPONENT=redis
OS_Prereqs


PRINT "Setup redis repos"
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
STAT $? "Setupredis repos "

PRINT "Install redis"
yum install redis -y
STAT $? "install redis"


PRINT "Update redis configuration file"
sed -i -e '/^bind/ c 0.0.0.0' /etc/redis.conf
STAT $? "Update redis configuration file"


PRINT "Start redis service"
systemctl enable redis
systemctl restart redis
STAT $? "Start redis service"
#
#STAT $? "Download Frontend "
#
#Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf & /etc/redis/redis.conf
#

# yum-config-manager --enable remi

