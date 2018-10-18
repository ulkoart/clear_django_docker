#!/usr/bin/env bash

set -e

host="$1"
shift

until psql -h "$host" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

# Start Collectstatic
echo Collectstatic.
python manage.py collectstatic -v0 --noinput -c

# Start migrate
echo Migrate.
python manage.py migrate -v0 --noinput

# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn project.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 2
