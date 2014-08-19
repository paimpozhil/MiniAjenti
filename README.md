MiniAjenti
==========

Ajenti wtih Ajenti-v inside Docker which can be used for hosting php & python web apps quickly.


##About Image

This Image will help you quickly setup your Dev environment comes with Nginx / PHP-FPM / Python / and all basic tools you require to start web development.

Instead of running random images for wordpress/drupal/magento/django/etc you get one image which you can easily host many apps all with different configurations.


Thanks to Centos **You get beautiful/easy YUM package manager**

Thanks to Ajenti Control panel you get the following
  * File Manager
  * Web Terminal
  * Cron management
  * Web apps Configurations/ Nginx reverse proxy /etc
  * Complete Dashboard with Load/Diskspace/etc monitoring.

## How to run

With Data Volumes 
paimpozhil/data image has 4 volumes /var/www/ /data /backup & /var/lib/mysql

```
docker run -td --name data  paimpozhil/data
docker run -d  --volumes-from data --name mysql centurylink/mysql
docker run -d  --volumes-from data --link mysql:db -p 8000:8000 -p 80:80 -p 443:443 -p 2222:22 -p 21:21 -p 8008:8008 --volumes-from data paimpozhil/miniajenti
```

Without Data volumes

```
docker run -td --name mysql centurylink/mysql
docker run -td --link mysql:db -p 8000:8000 -p 80:80 -p 443:443 -p 2222:22 -p 21:21 -p 8008:8008 --volumes-from data paimpozhil/miniajenti
```


##Now what?

Go visit your https://[public IP]:8000 and look around.

Its your Ajenti Control panel for your container(server)

Default logins are root/admin

## SSH ?

Why not.. ssh to your Public IP at port 2222 ( or whatever you gave above) 

Default logins are root/ch@ngem3

## PHPMYADMIN

Within the Ajenti Control panel.. you will see under websites-> PHPMYADMIN 

Click it and then disable the Maintenence mode.

Now visit 

https://[public IP]:8008 and hit enter.. you dont have to do anything else. 
Mysql is unsecure/ no password by default .


## How to setup Apps like Wordpress/Magento/etc?

http://dockerforums.com/t/magneto-hosting-on-docker-with-whatpanel/39

http://dockerforums.com/t/wordpress-hosting-on-docker-with-whatpanel/45

## WhatPanel ? 

WhatPanel is a larger project where we plan to replace large tools like Cpanel with help of Docker/Ajenti & other opensource tools.

MiniAjenti is a small part of the same base however it is more developer centric.

Data from MiniAjenti can be migrated seamlessly to run inside WhatPanel containers as well if you require hosting this later on production servers.




