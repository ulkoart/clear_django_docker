FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update \
    && apt-get install -y postgresql-client \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /src
ADD dockerfiles/docker-entrypoint.sh /
WORKDIR /src
ADD requirements.txt /src/
RUN pip install -r requirements.txt
ADD . /src