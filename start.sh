#!/bin/bash
chown -R www-data:www-data /usr/share/nginx/www
chmod -R 777 /usr/share/nginx/www

MYSQL_PASSWORD="Sxb@20040201";
  mysqladmin -u root password $MYSQL_PASSWORD
  mysql -uroot -p$MYSQL_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  killall mysqld

# start all the services
/usr/local/bin/supervisord -n
