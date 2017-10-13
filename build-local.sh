#!/bin/bash

# Set some variables
DOCKER_MACHINE_IP=127.0.0.1
EUREKA_PORT=8761
ZIPKIN_PORT=9411

echo ---- BUILD ALL PROJECTS ----
cd service-addressbook
mvn clean package
cd ..

cd service-client
mvn clean package
cd ..

cd service-eureka
mvn clean package
cd ..

cd service-gateway
mvn clean package
cd ..

cd service-hystrix
mvn clean package
cd ..

cd service-monitor
mvn clean package
cd ..

cd service-people
mvn clean package
cd ..

cd service-zipkin
mvn clean package
cd ..

echo ---- START Eureka ----
cd service-eureka
mvn -DDOCKER_MACHINE_IP=${DOCKER_MACHINE_IP} -DEUREKA_PORT=${EUREKA_PORT} -DZIPKIN_PORT=${ZIPKIN_PORT} spring-boot:run &
cd ..

echo ---- START Monitor ----
cd service-monitor
mvn -DDOCKER_MACHINE_IP=${DOCKER_MACHINE_IP} -DEUREKA_PORT=${EUREKA_PORT} -DZIPKIN_PORT=${ZIPKIN_PORT} spring-boot:run &
cd ..

echo ---- START Hystrix ----
cd service-hystrix
mvn -DDOCKER_MACHINE_IP=${DOCKER_MACHINE_IP} -DEUREKA_PORT=${EUREKA_PORT} -DZIPKIN_PORT=${ZIPKIN_PORT} spring-boot:run &
cd ..

echo ---- START Zipkin ----
cd service-zipkin
mvn -DDOCKER_MACHINE_IP=${DOCKER_MACHINE_IP} -DEUREKA_PORT=${EUREKA_PORT} -DZIPKIN_PORT=${ZIPKIN_PORT} spring-boot:run &
cd ..

echo ---- START Gateway ----
cd service-gateway
mvn -DDOCKER_MACHINE_IP=${DOCKER_MACHINE_IP} -DEUREKA_PORT=${EUREKA_PORT} -DZIPKIN_PORT=${ZIPKIN_PORT} spring-boot:run &
cd ..

echo ---- START Addressbook ----
cd service-addressbook
mvn -DDOCKER_MACHINE_IP=${DOCKER_MACHINE_IP} -DEUREKA_PORT=${EUREKA_PORT} -DZIPKIN_PORT=${ZIPKIN_PORT} spring-boot:run &
cd ..

echo ---- START People ----
cd service-people
mvn -DDOCKER_MACHINE_IP=${DOCKER_MACHINE_IP} -DEUREKA_PORT=${EUREKA_PORT} -DZIPKIN_PORT=${ZIPKIN_PORT} spring-boot:run &
cd ..

echo ---- START Client ----
cd service-client
mvn -DDOCKER_MACHINE_IP=${DOCKER_MACHINE_IP} -DEUREKA_PORT=${EUREKA_PORT} -DZIPKIN_PORT=${ZIPKIN_PORT} spring-boot:run &
cd ..