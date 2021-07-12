FROM davidcaste/alpine-tomcat:jre8tomcat7
WORKDIR /var/lib/docker/volumes/volume_one/_data
ADD hello-1.0.war /opt/tomcat/webapps
CMD  ["/opt/tomcat/bin/catalina.sh", "run"]