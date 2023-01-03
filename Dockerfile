# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "narayan.nayak1987@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps
