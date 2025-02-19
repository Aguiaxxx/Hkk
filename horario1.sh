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

# Ciclo contínuo para o primeiro turno
while true; do
    executar_app "00:00" "30m" &
    executar_app "02:00" "40m" &
    executar_app "04:30" "50m" &
    executar_app "07:00" "35m" &
    executar_app "09:15" "45m" &
    executar_app "11:30" "25m" &

    wait
done
