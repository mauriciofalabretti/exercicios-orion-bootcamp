# Builder

FROM python:3.11-alpine AS builder

WORKDIR /app
RUN apk update && apk add --no-cache gcc musl-dev postgresql-dev


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .


# Production

FROM python:3.11-alpine AS production

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

COPY app.py .

EXPOSE 5000

CMD ["python", "-m", "gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

