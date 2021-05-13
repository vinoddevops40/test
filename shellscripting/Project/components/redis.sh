#!/bin/bash
echo "installing catalogue through shell script"
source components/common.sh
echo Install catalogue Component
COMPONENT=redis
OS_Prereqs


PRINT "Setup redis repos"

if [ ! -f /etc/yum.repos.d/remi.repo ]; then
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
fi
STAT $? "Setupredis repos "

PRINT "Install redis"
yum install redis -y
STAT $? "install redis"


PRINT "Update redis configuration file"
sed -i -e '/^bind/ c bind 0.0.0.0' /etc/redis.conf
STAT $? "Update redis configuration file"


PRINT "Start redis service"
systemctl enable redis
systemctl restart redis
STAT $? "Start redis service"


