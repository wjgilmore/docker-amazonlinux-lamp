FROM amazonlinux:latest
MAINTAINER Casey Jones <caseyjonesdev@gmail.com>

RUN yum update -y && yum install -y \
httpd24 \
mod24_ssl \
php70 \
php70-bcmath \
php70-cli \
php70-common \
php70-dba \
php70-dbg \
php70-enchant \
php70-fpm \
php70-gd \
php70-gmp \
php70-imap \
php70-intl \
php70-json \
php70-ldap \
php70-mbstring \
php70-mcrypt \
php70-mysqlnd \
php70-odbc \
php70-opcache \
php70-pdo \
php70-pdo-dblib \
php70-pecl-igbinary \
php70-pecl-imagick \
php70-pecl-memcache \
php70-pecl-memcached \
php70-pecl-oauth \
php70-pecl-ssh2 \
php70-pecl-uuid \
php70-pecl-yaml \
php70-pgsql \
php70-process \
php70-pspell \
php70-recode \
php70-snmp \
php70-soap \
php70-tidy \
php70-xml \
php70-xmlrpc \
php70-zip \
mysql56-server \
&& yum clean all

ADD create-cert.sh /tmp/create-cert.sh
ADD server-config.sh /tmp/server-config.sh
ADD start-servers.sh /usr/sbin/start-servers

EXPOSE 80
EXPOSE 443
EXPOSE 3306

RUN /bin/bash /tmp/create-cert.sh && \
rm /tmp/create-cert.sh && \
/bin/bash /tmp/server-config.sh && \
rm /tmp/server-config.sh

CMD /usr/bin/env bash start-servers;sleep infinity
