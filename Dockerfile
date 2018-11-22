FROM ubuntu:bionic
MAINTAINER Makina Corpus "contact@makina-corpus.com"

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    binutils \
    build-essential \
    gettext \
    gdal-bin \
    python \
    python-dev \
    libgdal-dev \
    libpq-dev \
    libproj-dev \
    postgresql-client \
    wget \
    && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/*

RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm get-pip.py

# Set the locale
ENV LANG C.UTF-8
CMD ["/bin/bash"]