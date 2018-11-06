FROM ubuntu:bionic
MAINTAINER Makina Corpus "contact@makina-corpus.com"

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y -qq \
    # std libs
    unzip wget sudo less nano curl git gosu build-essential software-properties-common \
    # python basic libs
    python3.7 python3.7-dev gettext \
    # geodjango
    gdal-bin binutils libproj-dev libgdal-dev \
    # postgresql
    libpq-dev postgresql-client && \
    apt-get clean all && rm -rf /var/apt/lists/* && rm -rf /var/cache/apt/*

# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.7 get-pip.py && rm get-pip.py
RUN pip3 install --no-cache-dir setuptools wheel -U

CMD ["/bin/bash"]