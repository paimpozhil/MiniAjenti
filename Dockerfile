FROM centos:centos6

MAINTAINER paimpozhil@gmail.com

RUN yum -y install wget

RUN wget -O- https://raw.github.com/Eugeny/ajenti/master/scripts/install-rhel.sh | sh
             
RUN yum -y install /sbin/service which nano openssh-server git ajenti-v-python-gunicorn mysql php-mysql php-gd php-mcrypt php-zip php-xml php-iconv php-curl php-soap php-simplexml php-pdo php-dom php-cli tar \
              dbus-python.x86_64 dbus-python-devel.x86_64 dbus php-hash php-mysql vixie-cron ajenti-v ajenti-v-ftp-vsftpd ajenti-v-php-fpm ajenti-v-mysql ajenti

RUN chkconfig ajenti on

#allow the ssh root access.. - Diable if you dont need but for our containers we prefer SSH access.
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config

#cron needs this fix
RUN sed -i '/session    required   pam_loginuid.so/c\#session    required   pam_loginuid.so' /etc/pam.d/crond

RUN echo 'root:ch@ngem3' | chpasswd

EXPOSE 22 80 8000 443

CMD ["/sbin/init"]
