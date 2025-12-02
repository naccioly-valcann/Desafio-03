#!/bin/bash
# Este script roda em AfterInstall.

echo "Iniciando instalação de dependências e configuração do Supervisor..."

cd /appdir
npm install
if [ $? -ne 0 ]; then
  echo "ERRO: Falha no npm install."
  exit 1
fi

CONFIG_FILE="<NOME-APP>.conf"
SUPERVISOR_CONF_DIR="/etc/supervisor/conf.d"

if [ -f "$CONFIG_FILE" ]; then
    cp "$CONFIG_FILE" "$SUPERVISOR_CONF_DIR/$CONFIG_FILE"
    echo "Arquivo de configuração do Supervisor copiado para $SUPERVISOR_CONF_DIR."
else
    echo "AVISO: Arquivo de configuração $CONFIG_FILE não encontrado em /appdir. Continuando..."
fi

exit 0