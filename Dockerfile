FROM centos
MAINTAINER test@test.com
RUN mkdir /opt/tomcat/
RUN yum install wget -y
WORKDIR /opt/tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.22/bin/apache-tomcat-8.0.22.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.0.22/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
#COPY /var/lib/jenkins/sample.war /opt/tomcat/webapps
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
