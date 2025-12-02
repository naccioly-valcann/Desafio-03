#!/bin/bash

# --- Passo de Diagnóstico ---
echo "--- DIAGNÓSTICO DO CAMINHO DO PACKAGE.JSON ---"
# Procura o arquivo package.json em todo o sistema (limitando a /home e /opt/codedeploy-agent)
# NOTA: O CodeDeploy baixa os arquivos para /opt/codedeploy-agent/deployment-root/... antes de copiar para o destino.
# Vamos procurar na pasta raiz de deploy do agente e na pasta de destino (/appdir).

FIND_RESULT=$(find /appdir /opt/codedeploy-agent/deployment-root -name "package.json" 2>/dev/null)

if [ -n "$FIND_RESULT" ]; then
    echo "✅ package.json ENCONTRADO em:"
    echo "$FIND_RESULT"
else
    echo "❌ package.json NÃO ENCONTRADO em /appdir ou no cache do CodeDeploy."
fi
echo "------------------------------------------------"

# --- Passo de Instalação (Original) ---
echo "--- INICIANDO INSTALAÇÃO ---"
DEPLOY_PATH="/appdir" # Define o caminho de destino conforme appspec.yml

if [ -f "$DEPLOY_PATH/package.json" ]; then
    echo "Navegando para $DEPLOY_PATH..."
    cd $DEPLOY_PATH
    npm install
    echo "Instalação concluída com sucesso!"
    exit 0 # Sucesso
else
    echo "FALHA CRÍTICA: package.json não está em $DEPLOY_PATH."
    exit 1 # Falha
fi