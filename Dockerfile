FROM registry.aptero.co/projet-linux
COPY ./dockerscripts/ /dockerscripts/
COPY ./html_root/ /var/www/html/
CMD sh /dockerscripts/install_nginx_1.sh
CMD sh /dockerscripts/install_nginx_2.sh
