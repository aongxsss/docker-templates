FROM python:3.11-slim

RUN apt-get update --fix-missing
RUN apt install -y git netcat-traditional curl iputils-ping libpq-dev gcc

WORKDIR /airflow
COPY ./requirements.txt /airflow/requirements.txt
RUN pip install -r /airflow/requirements.txt


COPY . /airflow/
WORKDIR /airflow