awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13 {print}' >> /home/rye/sisop/modul1/syslogsoal5.log
