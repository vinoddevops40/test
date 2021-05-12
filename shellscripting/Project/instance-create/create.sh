#!/bin/bash

LID=lt-0da1fb56f241b319b
LVER=1
COMPONENT=$1

if [ -z "${COMPONENT}" ]; then
  echo "Component Name Input Needed"
  exit 1
fi


INSTANCE_EXIST=aws ec2 describe-instances --filters Name=tag:Name,Values=${COMPONENT} | jq .Reservations[]

if [ -z $(INSTANCE_EXIST) ]; then

    aws ec2 run-instances  --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
else
  echo "Instance ${COMPONENT} already exist"

fi




