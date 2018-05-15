FROM ubuntu:bionic
MAINTAINER Makina Corpus "contact@makina-corpus.com"

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    unzip wget sudo less nano curl language-pack-en-base git gettext python3.6 python3.6-dev \
    software-properties-common build-essential gdal-bin binutils libproj-dev libxml2-dev libxslt-dev libcairo2 \
    libpango1.0-0 libgdk-pixbuf2.0-dev libffi-dev shared-mime-info libpq-dev libgdal-dev libfreetype6-dev fonts-liberation \
    postgresql-client

RUN apt-get clean all && apt-get autoclean
RUN locale-gen en_US.UTF-8
