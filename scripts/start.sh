#!/bin/bash
nomeApp="<NOME-APP>"
# Apenas inicia o Supervisor
/usr/bin/supervisorctl reread
/usr/bin/supervisorctl update
/usr/bin/supervisorctl start $nomeApp