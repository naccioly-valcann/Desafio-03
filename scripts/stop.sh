#!/bin/bash
# Este script roda em ApplicationStop.

# O nome do programa conforme o app.conf
nomeApp="nacciolyapp" 

echo "Tentando parar o processo $nomeApp via Supervisor de forma tolerante a falhas..."

# Tenta parar o processo. Se o comando falhar (o processo não existe), o '|| true' 
# garante que o shell ignora o erro e continua (retorna código 0).
/usr/bin/supervisorctl stop $nomeApp || true

# Opcional: Remove o arquivo de configuração para garantir que o Supervisor não tente iniciar
# uma versão antiga da app se algo der errado no próximo deploy.
# Certifique-se de que o caminho abaixo está correto para o seu servidor.
SUPERVISOR_CONF_FILE="/etc/supervisor/conf.d/app.conf"
if [ -f "$SUPERVISOR_CONF_FILE" ]; then
    rm -f $SUPERVISOR_CONF_FILE
    echo "Configuração antiga do Supervisor removida."
fi


echo "Processo $nomeApp interrompido ou já estava inativo. Retornando sucesso."
exit 0