#!/bin/bash
Echo "check user to see if component executed using root user"

USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ]; then
  echo -e "\e[1;31mCheck Failed - You should be a root user to execute the command\e[0m"
  exit
fi