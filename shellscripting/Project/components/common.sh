#!/bin/bash
Echo "check user to see if component executed using root user"

USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ]; then
  echo -e "\e[1;31mCheck Failed - You should be a root user to execute the command\e[0m"
  exit 1
fi


print(){
echo "---------------------------------------------------------------"
echo -e "\e[1;35m [INFO] $1\e[0m"
echo "---------------------------------------------------------------"
}

STAT(){
if [ $1 -ne 0 ]; then
  echo "---------------------------------------------------------------"
  echo -e "\e[1;31m [ERROR] $2 is failure \e[0m"
  exit 2
else
  echo "---------------------------------------------------------------"
  echo -e "\e[1;32m [ERROR] $2 is successful \e[0m"
fi
}
