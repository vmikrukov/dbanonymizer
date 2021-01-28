#!/bin/bash -e

#yes y | docker-compose -f docker-compose.yml rm db-mysql

docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up && docker-compose -f docker-compose.yml rm -fsv
