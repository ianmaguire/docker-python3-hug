FROM python

MAINTAINER Ian Maguire <mr.scalability@gmail.com>

RUN mkdir -p /var/log/uwsgi/app/
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/www/

RUN pip install uwsgi
RUN pip install supervisor
RUN pip install hug

COPY app /var/www/app
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
