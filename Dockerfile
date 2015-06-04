FROM centos:6.6

RUN wget http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
RUN rpm -ivh jdk-8u45-linux-x64.rpm
RUN alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_45/jre/bin/java 1
RUN alternatives --set java /usr/java/jdk1.8.0_25/jre/bin/java
ADD target/docker-0.0.1-SNAPSHOT.jar /app/springboot-docker.jar
EXPOSE 8080
WORKDIR /app
CMD ["java","-jar","springboot-docker.jar"]
