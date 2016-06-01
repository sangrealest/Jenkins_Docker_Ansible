FROM nginx:latest
MAINTAINER Shanker shanker@yeah.net

ADD 2048-master /usr/share/nginx/html
ADD testfile /root/
EXPOSE 80

