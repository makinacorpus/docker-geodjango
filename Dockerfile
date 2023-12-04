FROM ubuntu:focal
LABEL Author="Makina Corpus contact@makina-corpus.com"

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
RUN apt-get update -qq && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -yqq software-properties-common wget && \
    printf "deb [arch=amd64] https://packages.geotrek.fr/ubuntu focal main" > /etc/apt/sources.list.d/geotrek.list && \
    wget -O- "https://packages.geotrek.fr/geotrek.gpg.key" | apt-key add -

RUN apt-get update -qq && apt-get -y upgrade && apt-get install -y -qq \
    # std libs
    git less nano curl \
    ca-certificates \
    wget build-essential\
    # python basic libs
    python3.10 python3.10-dev python3.10-venv python3.10-distutils gettext \
    # geodjango
    gdal-bin binutils libproj-dev libgdal-dev \
    # postgresql
    libpq-dev postgresql-client && \
    apt-get clean all && rm -rf /var/apt/lists/* && rm -rf /var/cache/apt/*

# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.10 get-pip.py && rm get-pip.py
RUN pip3.10 install --no-cache-dir setuptools wheel -U

CMD ["/bin/bash"]
