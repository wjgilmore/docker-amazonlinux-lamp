# Docker Amazon Linux LAMP

Creates a LAMP stack image using the official Amazon Linux image for [Docker](http://docker.com)


## Getting Started

This container is recommended for development use, to mirror or mimic development of an AWS EC2 instance running Amazon Linux. It includes MySQL 5.6, Apache 2.4 and most of the PHP 7.0.* packages.


### Basics

You will most likely want to develop on your local machine. Create your directory structure on your local machine and figure out where you want your web root to reside. Update the -v ~/www:/var/www/html with the path to your work directory.


```
docker run -ti --name lamp -p 80:80 -p 443:443 -p 3306:3306 -v ~/www:/var/www/html -d cjonesdev/amazonlinux-lamp
```


### Working with MySQL

If you want to connect to MySQL from your local machine, you will need to allow the root user or any other user access. The below snippet will allow full access to the root user. Never run this on a production server. Check out the MySQL documentation to figure out how to lock down a user based on ip and limit privileges/access. Run the below command for quick  and easy access.

```
docker exec lamp mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;FLUSH PRIVILEGES;"
```

By default, the root user doesn't have a password. Default access credentials are as follows:

Host: localhost
User: root

To set a new password for root (or any other user, do the following)

```
docker exec lamp mysql_secure_installation
```
