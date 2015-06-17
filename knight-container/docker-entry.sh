#!/bin/bash


#!/bin/bash
set -e

if [ "$1" = 'supervisord' ]; then
    /var/django-venv/bin/python /var/app/manage.py syncdb --noinput
    /var/django-venv/bin/python /var/app/manage.py collectstatic --noinput
    exec "$@"
fi

exec "$@"
