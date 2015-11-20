#!/bin/bash
NGINX="/usr/local/sbin/nginx"
PHPFPM="/usr/local/sbin/php-fpm"
GEARMAN="/usr/local/sbin/gearmand"
PIDPATH="/usr/local/var/run"
LOGPATH="/usr/local/var/log"

if [[ $1 = "start" ]]; then
    echo "Start gearmand ..."
    gearmand --queue-type mysql --mysql-user root --mysql-password 12121212 --mysql-db default --mysql-table gearman_queue -P $PIDPATH/gearmand.pid -l $LOGPATH/gearmand.log -d --verbose DEBUG
    echo "Start php-fpm ..."
    sudo $PHPFPM -D
    echo "Start nginx ..."
    sudo $NGINX
    echo "Done!"
elif [[ $1 = "stop" ]]; then
    echo "Stopping gearmand ..."
    kill -9 `cat $PIDPATH/gearmand.pid`
    echo "Stopping nginx ..."
    sudo kill `cat $PIDPATH/nginx.pid`
    echo "Stopping php-fpm ..."
    sudo kill `cat $PIDPATH/php-fpm.pid`
    echo "Done!"
elif [[ $1 = "restart" ]]; then
    echo "Stopping gearmand ..."
    kill -9 `cat $PIDPATH/gearmand.pid`
    echo "Stopping nginx ..."
    sudo kill `cat $PIDPATH/nginx.pid`
    echo "Stopping php-fpm ..."
    sudo kill `cat $PIDPATH/php-fpm.pid`
    echo "Start gearmand ..."
    gearmand --queue-type mysql --mysql-user root --mysql-password 12121212 --mysql-db default --mysql-table gearman_queue -P $PIDPATH/gearmand.pid -l $LOGPATH/gearmand.log -d --verbose DEBUG
    echo "Start php-fpm ..."
    sudo $PHPFPM -D
    echo "Start nginx ..."
    sudo $NGINX
    echo "Done!"
elif [[ $1 = "nginx" ]]; then
    if [[ $2 = "start" ]]; then
        echo "Start nginx ..."
        sudo $NGINX
        echo "Done!"
    elif [[ $2 = "stop" ]]; then
        echo "Stopping nginx ..."
        sudo kill `cat $PIDPATH/nginx.pid`
        echo "Done!"
    elif [[ $2 = "restart" ]]; then
        echo "Stopping nginx ..."
        sudo kill `cat $PIDPATH/nginx.pid`
        echo "Start nginx ..."
        sudo $NGINX
        echo "Done!"
    fi
elif [[ $1 = "php" ]] || [[ $1 = "php-fpm" ]]; then
    if [[ $2 = "start" ]]; then
        echo "Start php-fpm ..."
        sudo $PHPFPM -D
        echo "Done!"
    elif [[ $2 = "stop" ]]; then
        echo "Stopping php-fpm ..."
        sudo kill `cat $PIDPATH/php-fpm.pid`
        echo "Done!"
    elif [[ $2 = "restart" ]]; then
        echo "Stopping php-fpm ..."
        sudo kill `cat $PIDPATH/php-fpm.pid`
        echo "Start php-fpm ..."
        sudo $PHPFPM -D
        echo "Done!"
    fi
else
    echo "Valid commands: "
    echo "start | stop | restart"
    echo "------------------------------------"
    echo "nginx (start | stop | restart)"
    echo "php | php-fpm (start | stop | restart)"
fi
