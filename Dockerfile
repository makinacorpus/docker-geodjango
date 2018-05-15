FROM ubuntu:bionic
MAINTAINER Makina Corpus "contact@makina-corpus.com"

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    # std libs
    unzip wget sudo less nano curl git build-essential software-properties-common \
    # languages
    language-pack-en-base locales \
    # python and requirements libs
    python python-dev gettext libxml2-dev libxslt-dev libcairo2 libpango1.0-0 libgdk-pixbuf2.0-dev libffi-dev \
    shared-mime-info fonts-liberation libfreetype6-dev \
    # geodjango
    gdal-bin binutils libproj-dev libgdal-dev \
    # postgresql
    libpq-dev postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

CMD ["/bin/bash"]