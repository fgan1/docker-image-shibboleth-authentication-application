FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y maven
RUN apt-get install -y git

WORKDIR /home/ubuntu/

RUN git clone https://github.com/fogbow/common.git

WORKDIR /home/ubuntu/common

RUN mvn install -DskipTests

WORKDIR /home/ubuntu/

RUN git clone https://github.com/fogbow/shibboleth-authentication-application.git

WORKDIR /home/ubuntu/shibboleth-authentication-application

RUN git pull
RUN git checkout bug-fixes-07-2019

RUN mvn install -DskipTests

WORKDIR /home/ubuntu/
RUN mkdir files-conf-static
RUN mkdir files-conf-dinamic
RUN mkdir scripts

RUN mkdir .ssh
USER ubuntu
