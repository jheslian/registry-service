FROM registry.aptero.co/projet-linux
COPY ./dockerscripts/ /dockerscripts/
CMD sh /dockerscripts/install_nginx_1.sh && /dockerscripts/install_nginx_2.sh
COPY ./html_root/ /var/www/html/
#CMD sh /dockerscripts/install_nginx_2.sh
