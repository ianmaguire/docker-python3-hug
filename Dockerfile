FROM python

MAINTAINER Ian Maguire <mr.scalability@gmail.com>

RUN mkdir -p /var/www/
COPY app /var/www/app
RUN pip3 install -r /var/www/app/requirements.txt

EXPOSE 8000

CMD /usr/local/bin/uwsgi --http 0.0.0.0:8000 --wsgi-file  /var/www/app/hello.py --callable __hug_wsgi__
