#!/bin/bash
nomeApp="nacciolyapp"
CONFIG_FILE="/etc/supervisord.conf"
sudo /usr/bin/supervisorctl -c "$CONFIG_FILE" stop $nomeApp || true

exit 0
