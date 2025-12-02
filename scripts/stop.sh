#!/bin/bash
nomeApp="nacciolyapp"

echo "Tentando parar o processo $nomeApp via Supervisor..."

/usr/bin/supervisorctl stop $nomeApp 2>/dev/null

echo "Verificando o status de $nomeApp..."

/usr/bin/supervisorctl status $nomeApp | grep -q 'STOPPED' || true 

echo "Processo $nomeApp interrompido ou já estava inativo."
exit 0