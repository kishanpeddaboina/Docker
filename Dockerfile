FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY $(build.artifactstagingdirectory) /usr/local/tomcat/webapps/
EXPOSE 8080
#FROM ubuntu:16.04
#This is a sample Image 
#MAINTAINER demousr@gmail.com 
#RUN apt-add-repository ppa:mc3man/trusty-media
#RUN apt-get update 
#RUN apt-get install -y nginx 
#CMD [“echo”,”Image created”] 
