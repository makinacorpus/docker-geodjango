FROM ubuntu:bionic
MAINTAINER Makina Corpus "contact@makina-corpus.com"

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    # std libs
    unzip wget sudo less nano curl git gosu build-essential software-properties-common \
    # python basic libs
    python3.7 python3.7-dev gettext \
    # geodjango
    gdal-bin binutils libproj-dev libgdal-dev \
    # postgresql
    libpq-dev postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.7 get-pip.py && rm get-pip.py

CMD ["/bin/bash"]