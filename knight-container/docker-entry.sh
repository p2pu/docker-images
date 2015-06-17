#!/bin/bash

/var/django-venv/bin/python /var/app/manage.py syncdb --noinput
/var/django-venv/bin/python /var/app/manage.py collectstatic --noinput
cd /var/app
/var/django-venv/bin/gunicorn learnwithpeople.wsgi:application --bind 0.0.0.0:80 --workers=3
