#!/bin/bash

sudo apt install -y psmisc screen vim cron
sudo service cron start
(crontab -l ; echo "*/5 * * * * $HOME/jetksi/check.sh") | crontab -