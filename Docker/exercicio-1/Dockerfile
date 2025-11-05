# 1. Usa imagem base leve
FROM python:3.11-alpine

# 2. Configura o WORKDIR
WORKDIR /app

# 3. Copia o código da aplicação
COPY . /app

# 4. Instala dependências
RUN pip install -r requirements.txt

# 5. Define o comando de execução
CMD ["python", "app.py"]
