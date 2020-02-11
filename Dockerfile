FROM josue29/httpd-php

RUN		yum install -y wget tar

RUN		wget http://wordpress.org/latest.tar.gz
RUN 		tar -xzvf latest.tar.gz; mv wordpress/* /var/www/html/.
RUN		rm -rf wordpress

RUN		yum clean all && rm -rf /tmp/yum*
RUN		systemctl enable httpd

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
