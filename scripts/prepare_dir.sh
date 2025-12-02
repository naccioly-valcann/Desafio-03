#!/bin/bash
# Este script roda em BeforeInstall.

DEPLOY_PATH="/appdir"

echo "Executando limpeza profunda do diretório de destino: $DEPLOY_PATH"

# 1. Remove o diretório antigo com força (se existir)
if [ -d "$DEPLOY_PATH" ]; then
    # O comando 'rm -rf' é executado como root (conforme appspec.yml), 
    # garantindo que todos os arquivos sejam apagados.
    rm -rf $DEPLOY_PATH
    echo "Diretório existente $DEPLOY_PATH removido."
fi

# 2. Cria o novo diretório e define permissões
mkdir -p $DEPLOY_PATH
chown -R root:root $DEPLOY_PATH # Define root como dono
chmod -R 755 $DEPLOY_PATH # Define permissão de leitura/escrita para root e leitura para outros

echo "Diretório $DEPLOY_PATH preparado. O CodeDeploy agora copiará os arquivos."