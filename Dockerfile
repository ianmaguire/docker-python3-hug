FROM python

MAINTAINER Ian Maguire <mr.scalability@gmail.com>

RUN mkdir -p /var/www/

RUN pip3 install hug -U

COPY app /var/www/app

CMD [/usr/local/bin/hug -f /var/www/app/hello.py]
