#!/bin/bash
# Este script roda em ApplicationStop.

nomeApp="nacciolyapp"
SUPERVISOR_CONF_FILE="/etc/supervisor/conf.d/app.conf"

echo "Tentando parar e remover a configuração de $nomeApp."

# 1. Tenta PARAR o processo. 
# Captura o stderr e stdout para /dev/null, e o '|| true' garante o sucesso.
/usr/bin/supervisorctl stop $nomeApp > /dev/null 2>&1 || true

# 2. Tenta remover a configuração (para que o start.sh carregue a nova config)
# Isso é importante porque o ApplicationStop é a ÚLTIMA chance de remover o antigo .conf 
# antes que o novo seja copiado no AfterInstall.
if [ -f "$SUPERVISOR_CONF_FILE" ]; then
    rm -f $SUPERVISOR_CONF_FILE
    echo "Configuração antiga do Supervisor ($SUPERVISOR_CONF_FILE) removida."
fi

# 3. Recarrega as configurações do Supervisor (se o daemon estiver vivo).
# Se o supervisorctl reread falhar (daemon inativo), ignoramos o erro com '|| true'.
/usr/bin/supervisorctl reread || true
/usr/bin/supervisorctl update || true

echo "ApplicationStop concluído com sucesso."
# Retorna 0 para o CodeDeploy.
exit 0