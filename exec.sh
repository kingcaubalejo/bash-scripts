#!/bin/bash
exec > >(tee /var/tmp/user-data.log|logger -t user-data1 -s 2>/var/tmp/user-data.log) 2>&1

FILE_PATH="/etc/httpd/conf/httpd.conf"

if [ -d $FILE_PATH ]; then
    
    echo "Directory $FILE_PATH."

    sed '/DirectoryIndex index.html index.html.var/a DirectoryIndex index.php' $FILE_PATH

else

    echo "Error: Directory $FILE_PATH does not exists."

fi
echo "End is pogi."