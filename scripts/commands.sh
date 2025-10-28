#!/bin/sh
set -e

# Defaults se não vierem do env
POSTGRES_HOST=${POSTGRES_HOST:-psql}
POSTGRES_PORT=${POSTGRES_PORT:-5432}

# Aguardar resolução de DNS
until getent hosts "$POSTGRES_HOST" >/dev/null 2>&1; do
  echo "🟡 Waiting for DNS resolution ($POSTGRES_HOST) ..."
  sleep 1
done

# Aguardar porta abrir
until nc -z "$POSTGRES_HOST" "$POSTGRES_PORT"; do
  echo "🟡 Waiting for Postgres Database Startup ($POSTGRES_HOST $POSTGRES_PORT) ..."
  sleep 2
done

echo "✅ Postgres Database Started Successfully ($POSTGRES_HOST:$POSTGRES_PORT)"

python manage.py collectstatic --noinput
python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py runserver 0.0.0.0:8000