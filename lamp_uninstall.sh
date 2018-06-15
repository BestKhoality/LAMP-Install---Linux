#!/bin/bash

clear

#SET VARIABLES FOR EACH COMPONENT INSTALLED AS A COUNT
httpd_count=$(rpm -qa | grep httpd | wc -l)
maria_count=$(rpm -qa | grep maria | wc -l)
php_count=$(rpm -qa | grep php | wc -l)

printf "\n"
echo "-----------------------------------------------"
printf "Detecting if LAMP install exists...\n"
echo "-----------------------------------------------"

printf "httpd components installed...\n"
rpm -qa | grep httpd

printf "\n"
printf "maria components installed...\n"
rpm -qa | grep maria

printf "\n"
printf "php components installed...\n"
rpm -qa | grep php

echo "-----------------------------------------------"
printf "Begin LAMP Removal\n"
echo "-----------------------------------------------"

httpd_comp=$(rpm -qa | grep httpd | sed -n "${count}p")
maria_comp=$(rpm -qa | grep maria | sed -n "${count}p")
php_comp=$(rpm -qa | grep php | sed -n "${count}p")

#DETECT IF HTTPD COMPONENTS ARE INSTALLED
yum remove httpd-tools-2.4.6-45.el7.centos.4.x86_64 -y -q -e 0
#yum remove httpd-2.4.6-45.el7.centos.4.x86_64 -y -q -e 0
yum remove mariadb-libs-5.5.52-1.el7.x86_64 -y -q -e 0
#yum remove mariadb-5.5.52-1.el7.x86_64 -y -q -e 0
#yum remove mariadb-server-5.5.52-1.el7.x86_64 -y -q -e 0
#yum remove php-5.4.16-42.el7.x86_64 -y -q -e 0
yum remove php-common-5.4.16-42.el7.x86_64 -y -q -e 0
#yum remove php-mysql-5.4.16-42.el7.x86_64 -y -q -e 0
#yum remove php-pdo-5.4.16-42.el7.x86_64 -y -q -e 0

#CALL LAMP_STATUS SCRIPT AGAIN TO CHECK LAMP COMPONENTS POST REMOVAL
source /home/koa/Desktop/scripts/lamp_script/lamp_status.sh
lamp_status
