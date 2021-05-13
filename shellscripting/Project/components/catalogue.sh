#!/bin/bash
echo "installing catalogue through shell script"
source components/common.sh
echo Install catalogue Component
COMPONENT=catalogue
OS_Prereqs
NodeJS_Setup

Service_setup