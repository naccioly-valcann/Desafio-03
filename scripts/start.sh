#!/bin/bash
nomeApp="nacciolyapp"
echo "Recarregando e atualizando configurações do Supervisor..."
/usr/bin/supervisorctl reread
/usr/bin/supervisorctl update
echo "Tentando iniciar o processo $nomeApp..."
/usr/bin/supervisorctl start $nomeApp