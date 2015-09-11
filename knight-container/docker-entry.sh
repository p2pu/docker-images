#!/bin/bash
set -e

if [ "$1" = 'supervisord' ]; then
    chown -R celery:celery /var/lib/celery
    /var/django-venv/bin/python /var/app/manage.py syncdb --noinput
    /var/django-venv/bin/python /var/app/manage.py collectstatic --noinput
    exec "$@"
fi

exec "$@"
