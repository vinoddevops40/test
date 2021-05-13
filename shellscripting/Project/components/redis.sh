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
#
#STAT $? "Download Frontend "
#
#Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf & /etc/redis/redis.conf
#

# yum-config-manager --enable remi

# systemctl enable redis
# systemctl start redis