#!/usr/bin/env bash

# Comment out bindIp to allow remote accesss

sed -i "s|bindIp: 127.0.0.1|#bindIp: 127.0.0.1|g" /etc/mongod.conf

sed -i "s|#ServerName www\.example\.com:80|ServerName $HOSTNAME:80|g" /etc/httpd/conf/httpd.conf


echo "NETWORKING=yes" > /etc/sysconfig/network


#chkconfig httpd on
#chkconfig mysqld on

# Make sure we don't leave behind PID

/etc/init.d/httpd stop
/etc/init.d/mysqld stop
/etc/init.d/mongod stop
/etc/init.d/memcached stop