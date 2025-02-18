#!/bin/bash

while true; do
    echo "Iniciando app.py..."
    python3 app.py
    echo "app.py foi encerrado. Reiniciando em 5 segundos..."
    sleep 5
done
