#!/bin/bash

# 1. Navega para o diretório de destino
cd /appdir

# 2. Verifica onde o script está rodando (opcional, para debug)
echo "Diretório de trabalho atual: $(pwd)"

# 3. Verifica se o arquivo package.json existe
if [ -f package.json ]; then
  echo "package.json encontrado. Iniciando npm install..."
  # Instala as dependências
  npm install
else
  echo "ERRO: package.json não encontrado em /appdir. Verifique o appspec.yml e o pacote de deploy."
  exit 1 # Força a falha do hook para uma mensagem clara no log do CodeDeploy
fi