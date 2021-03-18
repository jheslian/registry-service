#!/bin/bash

#docker pull registry.aptero.co/projet-linux:latest
sudo docker build -t registry.aptero.co/projet-linux .

mapping=$1
if [[ $mapping == ????:?? ]]; then
	docker run -it --rm –p $2 --name projet-linux registry.aptero.co/projet-linux
else
	#Sera fonctionnel après création des deux scripts d'install nginx et inclusion dans dockerfile
	#docker run -it --rm –p 8080:80 --name projet-linux registry.aptero.co/projet-linux
	docker run -it --rm --name projet-linux registry.aptero.co/projet-linux
fi
