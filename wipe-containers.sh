#!/bin/bash

echo ---- SET DOCKER MACHINE VARIABLES ----
DOCKER_MACHINE_NAME="springPOCMachine"

echo ---- CREATE DOCKER MACHINE ----
docker-machine create -d virtualbox ${DOCKER_MACHINE_NAME}

echo ---- STARTING DOCKER MACHINE ----
docker-machine start ${DOCKER_MACHINE_NAME}
docker-machine regenerate-certs ${DOCKER_MACHINE_NAME} --force

echo --- SHOW ALL DOCKER MACHINES  ----
docker-machine ls

eval "$(docker-machine env ${DOCKER_MACHINE_NAME})"

echo --- STOPPING RUNNING CONTAINERS  ----


echo --- STOP AND DELETE ALL CONTAINERS AND IMAGES ---
docker-compose down
docker rmi $(docker images | grep latest | awk -F ' ' '{print $3}')
echo --- DONE ---