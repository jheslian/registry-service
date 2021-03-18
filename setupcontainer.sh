#!/bin/bash

docker pull registry.aptero.co/projet-linux:latest
sudo docker build -t registry.aptero.co/projet-linux .
sudo docker rm projet-linux 2> /dev/null
docker run --name projet-linux registry.aptero.co/projet-linux
#docker run -d –p 8080:80 projet-linux
