#FROM tomcat:8
# Take the war and copy to webapps of tomcat
#COPY target/*.war /usr/local/tomcat/webapps/
FROM ubuntu:16.04

MAINTAINER Chris Fidao

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

ADD default /etc/nginx/sites-available/default

EXPOSE 80
CMD ["nginx"]
