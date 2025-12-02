# #!/bin/bash
# nomeApp="nacciolyapp"

# sudo supervisorctl stop $nomeApp || true
#!/bin/bash
nomeApp="nacciolyapp"
supervisorctl_path=$(which supervisorctl)

# 1. Verifica se o supervisorctl existe
if [ -z "$supervisorctl_path" ]; then
    echo "ERRO CRÍTICO: O comando supervisorctl não foi encontrado no PATH."
    # Saída 0 para evitar que o CodeDeploy falhe o deploy antes de tentar corrigir.
    exit 0
fi

# 2. Tenta parar a aplicação e garante que o erro de "no such process" seja ignorado.
# A flag -q (quiet) é útil para suprimir algumas mensagens de erro.
# O comando completo é envolvido com '|| true' para capturar qualquer falha,
# seja "no such process" ou falha de comunicação com o daemon.
sudo "$supervisorctl_path" -q stop "$nomeApp" || true

echo "Comando de parada executado. O CodeDeploy pode prosseguir."
exit 0