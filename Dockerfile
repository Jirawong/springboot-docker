FROM centos:6.6

RUN yum -y install wget
RUN yum -y install tar
RUN yum -y install which
RUN wget --quiet --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
RUN rpm -ivh jdk-8u45-linux-x64.rpm
RUN alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_45/jre/bin/java 1
RUN alternatives --set java /usr/java/jdk1.8.0_45/jre/bin/java
RUN wget --quiet http://www.motorlogy.com/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
RUN tar xzf apache-maven-3.3.3-bin.tar.gz -C /opt/
RUN alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.3.3/bin/mvn 1
RUN alternatives --set mvn /opt/apache-maven-3.3.3/bin/mvn
ADD . /app/
RUN cd /app && mvn -q clean install
EXPOSE 8080
WORKDIR /app/target
CMD ["java","-jar","docker-0.0.1-SNAPSHOT.jar"]
