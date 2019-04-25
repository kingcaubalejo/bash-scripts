#!/bin/bash

#https://linux.101hacks.com/unix/tee-command-examples/
#Logs every echo made
exec > >(tee /var/tmp/provision-data.log|logger -t provision-data -s 2>/var/tmp/provision-data.log) 2>&1

### Variable Declaration
FILE_PATH="/etc/httpd/conf/httpd.conf"

#Change to root permission
echo "Change to root permission."
sudo su

#Updates the system (EC2 instance)
echo "Updates the system (EC2 instance)."
yum update -y

#Downloads the required modules or services
#Like mysql, php and etc.
echo "Downloads the php libapache-mod-php php-mcrypt php-mysql."
yum install -y php libapache-mod-php php-mcrypt php-mysql

#Restart apache web server
echo "Restart apache web server."
service httpd start

#Appends the user(ec2-user) to the group(apache)
# -a = append
# -G = group
echo "Appends the user(ec2-user) to the group(apache)."
usermod -a -G apache ec2-user

#Checks if the path is existing
if [ -d $FILE_PATH ]; then
    
    echo "Directory $FILE_PATH found."

    #Finds the pattern then it will append the string assigned under the pattern
    #
    # @pattern: 'Text is here'
    # @text: 'Hi'
    # syntax: sed '/@pattern/a @text' file_path
    #
    # Before 'sed'
    # Text is here
    # 
    # After 'sed'
    # Text is here
    # Hi
    #
    sed '/DirectoryIndex index.html index.html.var/a DirectoryIndex index.php' $FILE_PATH

else

    echo "Error: Directory $FILE_PATH does not exists."

fi

#Changes the ownership of the folder
echo "Change the ownership of the folder."
chown -R ec2-user:apache /var/www

#Change the permission of the folder
echo "Change the permission of the folder."
chmod 2775 /var/www

#Locates the folder with type directory and changed its permission
find /var/www -type d -exec chmod 2775 {} \;

#Locates the folder with type directory and changed its permission
find /var/www -type f -exec chmod 0664 {} \;

#Append the string in the file.
#It will be automatically created if no file is found.
echo "Append the string in the file."
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php