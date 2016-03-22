FROM python

MAINTAINER Ian Maguire <mr.scalability@gmail.com>

RUN mkdir -p /var/www/

RUN pip3 install hug -U
RUN pip3 install uwsgi -U

COPY app /var/www/app

CMD /usr/local/bin/uwsgi --http 0.0.0.0:8000 --wsgi-file  /var/www/app/hello.py --callable __hug_wsgi__
