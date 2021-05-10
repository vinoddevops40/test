#!/bin/bash
echo Hello World
echo How are you
ls
cat /etc/password
echo -e "Hello World\nHow are you"
echo -e "Hello World\n\nHow are you"
echo -e "\e[31mHello World in Red"
echo -e "Hello World"
echo -e "\e[32mHello World in Green"
echo -e "\e[1;33mHello World in yellow\e[0"


echo -e "***************************************"
echo  DevOps Training
echo  Traing for DeOps lasts 72 days
echo  Course name is DevOps

COURSE=DEVOPS
echo  "${COURSE} Training"
echo  "Traing for ${COURSE} lasts 72 days"
echo  "Course name is $COURSE"

a=100
FRUIT=APPLE
echo "$FRUIT is ${a}no"

DATE=$(date)
echo todays date is ${DATE}


