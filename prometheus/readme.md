Download Latest Update from below URL : 
https://prometheus.io/download/

Prometheus :

systemctl daemon-reload
systemctl stop prometheus
systemctl start prometheus
systemctl status prometheus

Alert Manager

systemctl daemon-reload
systemctl stop alertmanager
systemctl start alertmanager
systemctl status alertmanager

#Validate rule using below command
/usr/local/bin/promtool check rules alert_rules.yml