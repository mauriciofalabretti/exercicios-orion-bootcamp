import os
import time
import psycopg2
from flask import Flask

app = Flask(__name__)

DB_HOST = os.environ.get('DB_HOST')
DB_USER = os.environ.get('DB_USER')
DB_PASS = os.environ.get('DB_PASS')
DB_NAME = os.environ.get('DB_NAME')

def connect_to_db():
    conn = None
    for i in range(10):
        try:
            conn = psycopg2.connect(
                host=DB_HOST,
                database=DB_NAME,
                user=DB_USER,
                password=DB_PASS
            )
            print("Conexão com o banco de dados realizada com sucesso!")
            return conn
        except psycopg2.OperationalError as e:
            print(f"Tentativa {i+1}/10: Falha na conexão com o banco ({e}). Aguardando 3 segundos...")
            time.sleep(3)
    return None

@app.route('/')
def check_connection():
    conn = connect_to_db()

    if conn:
        try:
            cursor = conn.cursor()
            cursor.execute("CREATE TABLE IF NOT EXISTS status(message VARCHAR(255))")
            cursor.execute("INSERT INTO status (message) VALUES ('Conexão OK e gravação de dados funcional!')")
            conn.commit()
            return "Status: OK. A API se conectou ao DB e conseguiu gravar dados."
        except Exception as e:
            return f"Status: ERRO. Conectou, mas falhou ao gravar dados após várias tentativas."
        finally:
            conn.close()
    else:
        return "Status: ERRO. Falha ao conectar com o banco de dados após várias tentativas."


if __name__=='__main__':
    app.run(host='0.0.0.0', port=5000)