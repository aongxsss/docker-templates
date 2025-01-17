#!/bin/bash

echo "This is the webserver container and its db is ${POSTGRES_DB}"
echo "This is db host: ${POSTGRES_HOST}"

while ! nc -w 1 -z ${POSTGRES_HOST} 5432;
do 
    echo "wait db";
    echo "Checking if db is up for webserver";
    sleep 10;
done;

echo "Database is up, proceeding with Airflow setup."

airflow db init
airflow db migrate
airflow users create --role Admin --username admin --email admin --firstname admin --lastname admin --password admin
airflow webserver --port 8080