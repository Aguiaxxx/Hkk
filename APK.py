import subprocess import time

def rodar_app(): while True: print("Iniciando app.py...") processo = subprocess.Popen(["python3", "app.py"]) processo.wait()  # Aguarda o processo terminar print("app.py foi encerrado. Reiniciando em 5 segundos...") time.sleep(5)  # Espera 5 segundos antes de reiniciar

if name == "main": rodar_app()

￼Enter￼Enter
