sudo yum update

#Install apache
sudo yum install httpd -y
sudo yum remove httpd -y
#which httpd
#Check if httpd installed prior to starting
sudo systemctl status httpd
sudo systemctl start httpd
sudo systemctl stop httpd

#Adds httpd to start up on boot
sudo systemctl enable httpd

#visit http://serverIP
#Apache Test page should show

#Install MySQL
sudo yum install mariadb-server mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb.service
sudo mysql_secure_installation

#Need to set password

#Install PHP
sudo yum install php php-mysql
sudo systemctl restart httpd.service

#Write PHP info file
sudo vi /var/www/html/info.php

<?php
phpinfo();
?>

:wq!
