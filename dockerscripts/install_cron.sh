#!/bin/bash
apt install cron && touch /etc/cron.d/hello-cron && chmod 644 /etc/cron.d/hello-cron && crontab /etc/cron.d/hello-cron
echo "*/2 * * * * sh /dockerscripts/log_move.sh" > /dockerscripts/newcrontab
crontab /dockerscripts/newcrontab
rm /dockerscripts/newcrontab
echo "cron" >> /workspace/log_server/startup.sh
