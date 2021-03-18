FROM registry.aptero.co/projet-linux
COPY ./dockerscripts/ /dockerscripts/
CMD sh /dockerscripts/install_nginx_1.sh
