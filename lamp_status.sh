#!/bin/bash
function lamp_status {
printf "\n"
printf "Detecting installed components...\n"
printf "\n"
httpd_count=$(rpm -qa | grep httpd | wc -l)
maria_count=$(rpm -qa | grep maria | wc -l)
php_count=$(rpm -qa | grep php | wc -l)
#Condition if httpd components are not installed
if [ $httpd_count == 0 ]
then
        printf "httpd components are not installed...\n"
else
        printf "httpd components detected...\n"
        for ((count=1; count<=$httpd_count; count++)); do
                printf `rpm -qa | grep httpd | sed -n "${count}p"`
                printf "\n"
        done
fi
#Condition if mariadb components are not installed
if [ $maria_count == 0 ]
then
        printf "mariadb components are not installed...\n"
else
        printf "\n"
        printf "mariadb components detected...\n"
        for ((count=1; count<=$maria_count; count++)); do
                printf `rpm -qa | grep maria | sed -n "${count}p"`
                printf "\n"
        done
fi
#Condition if php components are not installed
if [ $php_count == 0 ]
then
        printf "php components are not installed...\n"
else
        printf "\n"
        printf "php components detected...\n"
        for ((count=1; count<=$php_count; count++)); do
                printf `rpm -qa | grep php | sed -n "${count}p"`
                printf "\n"
        done
fi
printf "\n"}
