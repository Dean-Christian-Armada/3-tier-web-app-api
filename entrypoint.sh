#!/bin/bash
## START to add psycopg2
# apk update
# apk add --virtual build-deps gcc musl-dev
# apk add postgresql-dev
## END to add psycopg2
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
gunicorn -c gunicorn_conf.py project.wsgi:application --reload