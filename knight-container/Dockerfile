FROM ubuntu:14.04

MAINTAINER Dirk Uys <dirkcuys@gmail.com>

# Install requirements
RUN apt-get update -qq && apt-get -qq upgrade
RUN apt-get install -qq python python-dev python-distribute python-pip git-core postgresql-client libpq-dev
RUN pip install virtualenv

# Setup virtual environment
RUN virtualenv /var/django-venv

# Setup application
RUN git clone https://github.com/p2pu/knight-app.git /var/app/ && rm -Rf /var/app/.git/
RUN /var/django-venv/bin/pip install -r /var/app/requirements.txt
#ADD /docker-enty.sh /var/docker-entry.sh

EXPOSE 80

CMD /var/django-venv/bin/python /var/app/manage.py syncdb --noinput && \
    /var/django-venv/bin/python /var/app/manage.py collectstatic --noinput && \
    cd /var/app && \
    /var/django-venv/bin/gunicorn learnwithpeople.wsgi:application --bind 0.0.0.0:80 --workers=3
