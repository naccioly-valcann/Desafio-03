#!/bin/bash
# Este script roda em BeforeInstall.

DEPLOY_PATH="/appdir"

echo "Preparando o diretório de destino: $DEPLOY_PATH"

# 1. Remove o diretório antigo (se existir) para garantir a limpeza completa
if [ -d "$DEPLOY_PATH" ]; then
    echo "Removendo diretório existente: $DEPLOY_PATH"
    rm -rf $DEPLOY_PATH
fi

# 2. Cria o novo diretório e define as permissões
mkdir -p $DEPLOY_PATH
chown -R root:root $DEPLOY_PATH
chmod -R 755 $DEPLOY_PATH

echo "Diretório $DEPLOY_PATH preparado. O CodeDeploy copiará os arquivos agora."