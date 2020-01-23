# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM python:latest

# If you prefer miniconda:
#FROM continuumio/miniconda3

#RUN apk add --no-cache git
#RUN apk add --no-cache uwsgi
RUN apt-get update
RUN pip install uwsgi

LABEL Name=flask-container-template Version=0.0.1
EXPOSE 5000

WORKDIR /app


# Using pip:

COPY requirements/ requirements
RUN python3 -m pip install -r requirements/dev.txt

COPY . /app

#CMD ["flask", "run", "--host=0.0.0.0"]
ENV PYTHONPATH "${PYTHONPATH}:/app"
CMD ["uwsgi", "--ini", "uwsgi.ini"]

# Using pipenv:
#RUN python3 -m pip install pipenv
#RUN pipenv install --ignore-pipfile
#CMD ["pipenv", "run", "python3", "-m", "flask-container-template"]

# Using miniconda (make sure to replace 'myenv' w/ your environment name):
#RUN conda env create -f environment.yml
#CMD /bin/bash -c "source activate myenv && python3 -m flask-container-template"
