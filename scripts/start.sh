#!/bin/bash
# Este script roda em ApplicationStart.

nomeApp="nacciolyapp"

# 1. Reinicia o serviço Supervisor (se estiver usando systemd)
echo "Garantindo que o serviço Supervisor está ativo..."
systemctl restart supervisor || service supervisor restart || true

# 2. Recarrega a configuração. Agora o Supervisor deve estar vivo.
echo "Recarregando e atualizando configurações do Supervisor..."
/usr/bin/supervisorctl reread
/usr/bin/supervisorctl update

# 3. Inicia o processo
echo "Tentando iniciar o processo $nomeApp..."
/usr/bin/supervisorctl start $nomeApp