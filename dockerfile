FROM selenium/node-chrome:latest

USER root

WORKDIR /home/app

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y openjdk-14-jdk
RUN export JAVA_HOME=/usr/lib/jvm/java-14-openjdk-amd64
RUN apt-get -y install curl gnupg
RUN apt-get -y install g++ build-essential
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get -y install nodejs
RUN apt-get -y install git
RUN git clone https://github.com/hyfzur/wdio-test.git
RUN cd wdio-test && npm install
# RUN cd wdio-test && npm run test