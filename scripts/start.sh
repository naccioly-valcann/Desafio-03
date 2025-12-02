#!/bin/bash
nomeApp="nacciolyapp"
CONFIG_FILE="/etc/supervisord.conf"
cd /appdir
npm install
sudo /usr/bin/supervisord -c "$CONFIG_FILE"
sudo supervisorctl -c "$CONFIG_FILE" start $nomeApp