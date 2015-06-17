FROM ubuntu:14.04

MAINTAINER Dirk Uys <dirkcuys@gmail.com>

# Install requirements
RUN apt-get update && apt-get install -y \
    python \
    python-dev \
    python-distribute \
    python-pip \
    git-core \
    postgresql \
    postgresql-client \
    libpq-dev \
    python-virtualenv

# Setup virtual environment
RUN virtualenv /var/django-venv

# Setup application
RUN git clone https://github.com/p2pu/knight-app.git /var/app/ && rm -Rf /var/app/.git/
RUN /var/django-venv/bin/pip install -r /var/app/requirements.txt
ADD docker-entry.sh /var/docker-entry.sh

EXPOSE 80
VOLUME /var/app/static_serve

CMD /var/docker-entry.sh
