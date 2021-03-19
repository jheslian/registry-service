#!/bin/bash
# Update the package list, create a crontab file and gives it the permissions to be accessed and executed
apt install cron && touch /etc/cron.d/hello-cron && chmod 644 /etc/cron.d/hello-cron && crontab /etc/cron.d/hello-cron
# Adds the cronjob to the crontabs, using a temporary file
echo "*/2 * * * * sh /dockerscripts/log_move.sh" > /dockerscripts/newcronjob
crontab /dockerscripts/newcronjob
rm /dockerscripts/newcronjob
# Adds a command to start cron at the container startup
echo "cron" >> /workspace/log_server/startup.sh
