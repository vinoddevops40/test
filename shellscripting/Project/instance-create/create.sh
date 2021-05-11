#!/bin/bash

LID=lt-0da1fb56f241b319b
LVER=1
COMPONENT=$1

if [ -z "${COMPONENT}" ];
  echo "Component Name Input Needed"
  exit 1
fi

aws ec2 run-instances  --launch-template LaunchTemplateId=${LID},Version=${LVER} --tag-specifications
          "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}]" | jq



