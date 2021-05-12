#!/bin/bash

LID=lt-0da1fb56f241b319b
LVER=1
COMPONENT=$1

if [ -z "${COMPONENT}" ]; then
  echo "Component Name Input Needed"
  exit 1
fi


INSTANCE_EXIST=aws ec2 describe-instances --filters Name=tag:Name,Values=${COMPONENT} | jq .Reservations[]
STATE=aws ec2 describe-instances --filters Name=tag:Name,Values=user | jq .Reservations[].Instances[].State.Name | xargs

if [ -z $(INSTANCE_EXIST) -o "$STATE" == "terminated" ]; then

    aws ec2 run-instances  --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
else
  echo "Instance ${COMPONENT} already exist"

fi

IPADDRESS=aws ec2 describe-instances --filters Name=tag:Name,Values=user | jq .Reservations[].Instances[].PrivateIpAddress | grep -v null | xargs
sed -e "s/COMPONENT/${COMPONENT}/" -e "s/IPADDRESS/${IPADDRESS}/" record.json >/tmp/record.json
aws route53 change-resource-record-sets --hosted-zone-id Z0119149I8S0IAPXEMO8 --change-batch file:///tmp/record.json



