FROM python

MAINTAINER Ian Maguire <mr.scalability@gmail.com>

RUN mkdir -p /var/log/uwsgi/app/
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/www/

RUN pip3 install uwsgi
RUN pip3 install supervisor
RUN pip3 install hug

COPY app /var/www/app
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
