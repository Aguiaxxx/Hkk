#!/bin/bash

while true; do
    echo "Iniciando app.py..."
    timeout 30m python3 app.py
    echo "app.py foi encerrado. Aguardando 10 minutos antes de reiniciar..."
    sleep 10m
done
