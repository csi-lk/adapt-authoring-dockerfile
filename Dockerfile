# Adapt authoring server based on Ubuntu 14.04
FROM ubuntu:14.04
MAINTAINER Callum Silcock "callum@webanyti.me"
RUN echo -e "----------------------\nStarting apt installations \n----------------------"
RUN	sudo apt-get update
RUN	sudo apt-get install --yes git curl software-properties-common
RUN	sudo add-apt-repository -y ppa:mc3man/trusty-media
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN	sudo apt-get install --yes nodejs mongodb-org ffmpeg frei0r-plugins
RUN	sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
RUN echo -e "----------------------\nStarting npm installations \n----------------------"
RUN	npm install -g grunt-cli adapt-cli
RUN	git clone https://github.com/adaptlearning/adapt_authoring.git
WORKDIR "/adapt_authoring"
RUN	npm install --production
#RUN echo -e "----------------------\nRunning adapt install, please install on port 80 \n----------------------"
#RUN node install
#RUN echo -e "----------------------\nRunning adapt server \n----------------------"
#RUN node server
#RUN echo -e "----------------------\nShould be good to go :) \n----------------------"
EXPOSE 80