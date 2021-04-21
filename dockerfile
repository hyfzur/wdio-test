FROM ubuntu:20.04

USER root

WORKDIR /home/app

COPY ./package.json /home/app/package.json

RUN apt-get update

RUN apt-get -y install curl gnupg

RUN apt-get install g++ build-essential --yes

RUN curl -sL https://deb.nodesource.com/setup_15.x  | bash -

RUN apt-get -y install nodejs

RUN apt-get install git --yes

