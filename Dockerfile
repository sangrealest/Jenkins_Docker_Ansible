FROM nginx:latest
MAINTAINER Shanker shanker@yeah.net

ADD 2048-master /usr/share/nginx/html
EXPOSE 80

