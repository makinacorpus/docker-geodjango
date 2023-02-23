FROM ubuntu:bionic
LABEL Author="Makina Corpus contact@makina-corpus.com"

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install -y -qq \
    # std libs
    software-properties-common && \
    apt-get clean all && rm -rf /var/apt/lists/* && rm -rf /var/cache/apt/*

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update -qq && apt-get install -y -qq \
    # std libs
    git less nano curl \
    ca-certificates \
    wget build-essential\
    # python basic libs
    python3.8 python3.8-dev python3.8-venv gettext \
    # geodjango
    gdal-bin binutils libproj-dev libgdal-dev \
    # postgresql
    libpq-dev postgresql-client && \
    apt-get clean all && rm -rf /var/apt/lists/* && rm -rf /var/cache/apt/*

# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.8 get-pip.py && rm get-pip.py
RUN pip3 install --no-cache-dir setuptools wheel -U

CMD ["/bin/bash"]
