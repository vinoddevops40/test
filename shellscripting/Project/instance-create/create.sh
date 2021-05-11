#!/bin/bash

LID=lt-0da1fb56f241b319b
LVER=1

aws ec2 run-instances  --launch-template LaunchTemplateId=${LID},Version=${LVER} | jq



