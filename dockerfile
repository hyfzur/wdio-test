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

RUN apt-get install wget --yes

RUN apt-get install g++ build-essential --yes

# Update the timezone
# RUN apt-get install tzdata
# ENV TZ=Asia/Kolkata
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# RUN dpkg-reconfigure --frontend noninteractive tzdata

# RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN git clone https://github.com/hyfzur/wdio-test.git

# ARG CHROME_VERSION="google-chrome-stable"
# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#   && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
#   && apt-get update -qqy \
#   && apt-get -qqy install \
#     ${CHROME_VERSION:-google-chrome-stable} \
#   && rm /etc/apt/sources.list.d/google-chrome.list \
#   && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN cd wdio-test && npm install
# RUN cd wdio-test && npm run test

# Setup for display of test report
RUN apt-get install nginx -y
# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 90

# Set the default command to execute
# when creating a new container
CMD service nginx start