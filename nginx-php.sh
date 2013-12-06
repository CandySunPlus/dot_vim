#!/bin/bash
NGINX="/usr/local/sbin/nginx"
PHPFPM="/usr/local/sbin/php-fpm"
PIDPATH="/usr/local/var/run"

if [[ $1 = "start" ]]; then
    echo "Start php-fpm ..."
    sudo $PHPFPM -D
    echo "Start nginx ..."
    sudo $NGINX
    echo "Done!"
elif [[ $1 = "stop" ]]; then
    echo "Stopping nginx ..."
    sudo kill `cat $PIDPATH/nginx.pid`
    echo "Stopping php-fpm ..."
    sudo kill `cat $PIDPATH/php-fpm.pid`
    echo "Done!"
elif [[ $1 = "restart" ]]; then
    echo "Stopping nginx ..."
    sudo kill `cat $PIDPATH/nginx.pid`
    echo "Stopping php-fpm ..."
    sudo kill `cat $PIDPATH/php-fpm.pid`
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
