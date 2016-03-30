# Adapt authoring server based on Ubuntu 14.04
FROM ubuntu:14.04
RUN \
	echo "Starting installation"
	sudo apt-get update
	sudo apt-get install --yes git curl software-properties-common
	sudo add-apt-repository -y ppa:mc3man/trusty-media
	sudo ln -s /usr/bin/nodejs /usr/bin/node
	sudo apt-get install --yes nodejs mongodb ffmpeg frei0r-plugins
	sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
	npm install -g g	-cli adapt-cli pm2
	git clone --branch v0.1.4 https://github.com/adaptlearning/adapt_authoring.git
	cd adapt-authoring
	npm install --production
EXPOSE 80