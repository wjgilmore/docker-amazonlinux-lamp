# Docker Amazon Linux LAMP

Creates a LAMP stack image using the official Amazon Linux image for [Docker](http://docker.com)


## Getting Started

This container is recommended for development use, to mirror or mimic development of an AWS EC2 instance running Amazon Linux. It includes MySQL 5.7, Apache 2.4 and most of the PHP 7.0.* packages.


#### Build Image
Navigate to directory containing docker file. If downloading from Docker Hub, move on to "Create Container" section.

```
docker build -t imageName .
```


### Create Container

You will most likely want to develop on your local machine. Create your directory structure on your local machine and figure out where you want your web root to reside. Update the -v ~/www:/var/www/html with the path to your work directory.

```
# Custom Image Build
docker run -ti --name lamp -p 80:80 -p 443:443 -p 3306:3306 -p 11211:11211 -v ~/www:/var/www/html -d imagesName

# Download and Build from Docker Hub
docker run -ti --name lamp -p 80:80 -p 443:443 -p 3306:3306 -p 11211:11211 -v ~/www:/var/www/html -d wjgilmore/docker-amazonlinux-lamp-mysql57
```


### Working with MySQL

If you want to connect to MySQL from your local machine, you will need to allow the root user or any other user access. The below snippet will allow full access to the root user. Never run this on a production server. Check out the MySQL documentation to figure out how to lock down a user based on ip and limit privileges/access. Run the below command for quick  and easy access.

```
docker exec lamp mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;FLUSH PRIVILEGES;"
```

By default, the root user doesn't have a password. Default access credentials are as follows:

Host: localhost
User: root

To set a new password for root

```
docker exec -ti --privileged lamp mysql_secure_installation
```


### Login as ec2-user

```
docker exec -ti -u ec2-user lamp bash
```
