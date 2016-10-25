FROM centos:6
MAINTAINER Jie Rong <rainmore24@gmail.com>

RUN yum update; yum -y install httpd php php-mysql php-curl; yum clean all
	
RUN echo 'ServerName localhost' >> /etc/httpd/conf.d/fqdn.conf
RUN echo 'Include sites-enabled/*.conf' >> /etc/httpd/conf/httpd.conf

RUN sed -i 's/;date.timezone\ =/date.time\ =\ Australia\/Sydney/g' /etc/php.ini
RUN mkdir -p /var/www/build/app/webdrive

VOLUME /var/www/
VOLUME /etc/httpd/site-enabled/

EXPOSE 80
