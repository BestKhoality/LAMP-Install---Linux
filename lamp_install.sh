#!/bin/bash
clear
source /home/koa/Desktop/scripts/lamp_script/lamp_status.sh
lamp_status

httpd_count=$(rpm -qa | grep httpd | wc -l)
maria_count=$(rpm -qa | grep maria | wc -l)
php_count=$(rpm -qa | grep php | wc -l)

printf "\n"
echo "-----------------------------------------------"
printf "Beginning LAMP install...\n"
echo "-----------------------------------------------"
printf "\n"

#CONDITION TO INSTALL HTTPD
if [ $httpd_count == 0 ]
then
        #Install httpd with -Y parameter
        sudo yum install httpd -y -q -e 0
else
        printf "httpd install failed...\n"
fi

#CONDITION TO INSTALL MARIA DB
if [ $maria_count == 0 ]
then
        sudo yum install mariadb-server mariadb -y -q -e 0
else
        printf "maria install failed...\n"
fi

#CONDITION TO INSTALL PHP
if [ $php_count == 0 ]
then
        sudo yum install php php-mysql -y -q -e 0
else
        printf "php install failed...\n"
fi

source /home/koa/Desktop/scripts/lamp_script/lamp_status.sh
lamp_status
