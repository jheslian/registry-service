FROM registry.aptero.co/projet-linux
COPY ./dockerscripts/ /dockerscripts/
RUN echo "echo OUFOYVDLDZAHDZAAZDOZAD" >> /workspace/log_server/startup.sh
RUN sh /dockerscripts/install_nginx_2.sh
RUN sh /dockerscripts/install_nginx_1.sh
RUN sh /workspace/log_server/startup.sh
RUN cat /workspace/log_server/startup.sh
COPY ./html_root/ /var/www/html/
