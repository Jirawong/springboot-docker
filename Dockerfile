FROM centos:6.6

RUN wget http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
RUN rpm -ivh jdk-8u45-linux-x64.rpm
RUN alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_45/jre/bin/java 1
RUN alternatives --set java /usr/java/jdk1.8.0_25/jre/bin/java
RUN wget http://www.motorlogy.com/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
RUN tar xzvf apache-maven-3.3.3-bin.tar.gz -C /opt/
RUN alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.3.3/bin/mvn 1
RUN alternatives --set mvn /opt/apache-maven-3.3.3/bin/mvn
ADD . /app/
RUN cd /app; mvn clean install
EXPOSE 8080
WORKDIR /app
CMD ["java","-jar","docker-0.0.1-SNAPSHOT.jar"]
