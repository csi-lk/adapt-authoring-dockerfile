# Adapt Authoring Dockerfile

A Dockerfile that follows instructions on the Adapt Authoring Wiki page for [server installation](https://github.com/adaptlearning/adapt_authoring/wiki/Install-on-Server) up to the `node install` step.

Instructions

1. Install (Docker)[https://www.docker.com/]

2. Build the adapt authoring dockerfile

	```
docker build -t "dockerfile/adapt-authoring" github.com/csilk/adapt-authoring-dockerfile
```

3. Run the docker container

	```
docker run -t -d -p 80:80 dockerfile/adapt-authoring
``` 

3. Change into the adapt-authoring directory

	```
cd adap_authoring
```

4. Run the installation script

	```
node install
```

5. Run the server

	```
node server
```

All done, should be set up with your settings :)
