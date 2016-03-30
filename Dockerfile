# Adapt authoring server based on Ubuntu 14.04
FROM ubuntu:14.04
MAINTAINER Callum Silcock "callum@webanyti.me"
RUN echo "Starting apt installations"
RUN	sudo apt-get update
RUN	sudo apt-get install --yes git curl software-properties-common
RUN	sudo add-apt-repository -y ppa:mc3man/trusty-media
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN	sudo apt-get install --yes nodejs mongodb ffmpeg frei0r-plugins
RUN	sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
RUN echo "Starting npm installations"
RUN	npm install -g grunt-cli adapt-cli pm2
RUN	git clone --branch v0.1.4 https://github.com/adaptlearning/adapt_authoring.git
RUN	cd adapt-authoring
RUN	npm install --production
RUN echo "Running adapt install, please install on port 80"
RUN node install
RUN echo "Running adapt server"
RUN node server
RUN echo "Should be good to go :)"
EXPOSE 80