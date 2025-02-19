#!/bin/bash

executar_app() {
    local horario_inicio="$1"
    local tempo_execucao="$2"

    while true; do
        agora=$(date +%H:%M)

        if [[ "$agora" == "$horario_inicio" ]]; then
            echo "[$(date)] Iniciando app.py (Horário: $horario_inicio)..."
            python3 app.py &  
            pid=$!  

            sleep "$tempo_execucao"  
            
            echo "[$(date)] Encerrando app.py após $tempo_execucao..."
            kill $pid  
            wait $pid 2>/dev/null  

            echo "[$(date)] app.py encerrado. Aguardando o próximo horário..."
        fi

        sleep 30  
    done
}

# Ciclo contínuo para o terceiro turno
while true; do
    executar_app "00:55" "35m" &
    executar_app "03:25" "40m" &
    executar_app "06:00" "50m" &
    executar_app "08:15" "25m" &
    executar_app "10:50" "30m" &
    executar_app "13:00" "45m" &

    wait
done
