FROM python

MAINTAINER Ian Maguire <mr.scalability@gmail.com>

RUN mkdir -p /var/www/

RUN pip3 install hug -U
RUN pip3 install gunicorn -U

COPY app /var/www/app

CMD ["/usr/local/bin/gunicorn /var/www/app/hello.py:__hug_wsgi__"]
