#!/bin/bash
# Este script roda em AfterInstall, onde os arquivos JÁ FORAM copiados para /appdir.

echo "Iniciando instalação de dependências..."

# Navega para o diretório de destino onde os arquivos foram copiados
cd /appdir

# O package.json AGORA deve estar aqui
if [ -f package.json ]; then
  echo "package.json encontrado. Executando npm install..."
  
  # Instala as dependências
  npm install 
  
  if [ $? -eq 0 ]; then
    echo "npm install concluído com sucesso."
  else
    echo "ERRO: Falha no npm install."
    exit 1
  fi
else
  # Esta falha indica um problema de cópia ou permissão, mas agora é menos provável
  echo "ERRO CRÍTICO: package.json não está em /appdir. Verifique appspec.yml (files section)."
  exit 1
fi