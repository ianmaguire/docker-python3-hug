FROM ubuntu:14.04

MAINTAINER Ian Maguire <mr.scalability@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install nginx python3 sed python-pip python-dev uwsgi-plugin-python supervisor

RUN mkdir -p /var/log/nginx/app
RUN mkdir -p /var/log/uwsgi/app/


RUN rm /etc/nginx/sites-enabled/default
COPY hug.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/hug.conf /etc/nginx/sites-enabled/hug.conf
COPY uwsgi.ini /var/www/app/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf


RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

copy app /var/www/app
RUN pip install -r /var/www/app/requirements.txt

#EXPOSE 80

CMD ["/usr/bin/supervisord"]
