#! /bin/bash

python manage.py collectstatic -v0 --noinput -c
python manage.py migrate -v0 --noinput
gunicorn project.wsgi -b :8000 -w 2 --timeout 1200