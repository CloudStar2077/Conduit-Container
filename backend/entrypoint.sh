#!/bin/bash
set -e

echo "[ENTRYPOINT] Apply migrations..."
python manage.py migrate --noinput

echo "[ENTRYPOINT] Starting server..."
exec "$@"