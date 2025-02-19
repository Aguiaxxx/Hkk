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

# Ciclo contínuo para o segundo turno
while true; do
    executar_app "00:30" "25m" &
    executar_app "02:40" "45m" &
    executar_app "05:20" "30m" &
    executar_app "07:35" "40m" &
    executar_app "10:00" "50m" &
    executar_app "12:00" "35m" &

    wait
done
