#!/bin/bash
echo "installing catalogue through shell script"
source components/common.sh
echo Install catalogue Component
COMPONENT=redis
OS_Prereqs



# yum install epel-release yum-utils -y
# yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
# yum-config-manager --enable remi
# yum install redis -y


Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf & /etc/redis/redis.conf


# systemctl enable redis
# systemctl start redis