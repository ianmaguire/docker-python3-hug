FROM python:3

MAINTAINER Ian Maguire <mr.scalability@gmail.com>

copy app /var/www/app
RUN pip install -r /var/www/app/requirements.txt

#EXPOSE 8000

CMD ["hug -f /var/www/app/hello.py"]
