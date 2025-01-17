#!/bin/bash

echo "This is the scheduler container and its db is ${POSTGRES_DB}"
echo "This is db host: ${POSTGRES_HOST}"

while ! nc -w 1 -z ${POSTGRES_HOST} 5432;
do 
    echo "wait db";
    echo "Checking if db is up";
    sleep 2;
done;

while ! nc -w 1 -z airflow-webserver 8080;
do 
    echo "wait webserver";
    echo "Checking if webserver is up";
    sleep 2;
done;

airflow db migrate 
airflow scheduler