#!/bin/bash

#docker pull registry.aptero.co/projet-linux:latest
#sudo docker build -t registry.aptero.co/projet-linux .
sudo docker rm -f projet-linux 2> /dev/null
docker run -it -p 8080:80 --name projet-linux registry.aptero.co/projet-linux
sudo docker ps
