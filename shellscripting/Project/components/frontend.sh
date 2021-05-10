#!/bin/bash
#installing Front end component for Roboshop Project
echo Install Frontend Component

<<USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ]; then
  echo -e "\e[1;31mYou should be a root user to execute the command\e[0m"
  exit
fi>>

yum install nginx
