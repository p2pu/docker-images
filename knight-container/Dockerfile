FROM ubuntu:14.04

MAINTAINER Dirk Uys <dirkcuys@gmail.com>

# Install requirements
RUN apt-get update && apt-get install -y \
    git-core \
    libpq-dev \
    postgresql-client \
    python \
    python-dev \
    python-distribute \
    python-pip \
    python-virtualenv \
    supervisor


# Setup application
ADD https://github.com/p2pu/learning-circles/archive/master.tar.gz /tmp/master.tar.gz
RUN tar -x -z --xform "s#[^/]*/#app/#" -f /tmp/master.tar.gz -C /var && rm -rf /tmp/master.tar.gz
RUN virtualenv /var/django-venv && /var/django-venv/bin/pip install -r /var/app/requirements.txt
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker-entry.sh /docker-entry.sh
RUN mkdir -p /var/lib/celery && useradd celery && chown celery:celery /var/lib/celery/

EXPOSE 80

VOLUME /var/app/static_serve
VOLUME /var/app/upload
VOLUME /var/lib/celery/

ENTRYPOINT ["/docker-entry.sh"]

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
