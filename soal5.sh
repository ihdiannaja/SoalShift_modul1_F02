awk ‘BEGIN{IGNORECASE=1} /cron/ && !/sudo/ && NF < 13’ /var/log/syslog >> /home/rye/sisop/modul1/syslogsoal5.log
