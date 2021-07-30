# syntax=docker/dockerfile:experimental
FROM python:3.9-slim
LABEL maintainer="Balmar Group corporation"

ENV PYTHONUNBUFFERED 1

RUN apt update
RUN apt-get install -y gdal-bin \
 libgdal-dev \
 libffi-dev \
 git \
 curl


RUN  mkdir /app

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/

RUN adduser  user
USER user


