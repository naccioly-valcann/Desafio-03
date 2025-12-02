#!/bin/bash
nomeApp="nacciolyapp"
cd /appdir
npm install

sudo supervisord
sudo supervisorctl start $nomeApp