#!/bin/bash

docker-compose up --force-recreate --always-recreate-deps redis-cluster

export HOST_IP=$(ipconfig getifaddr en0)
./create-cluster.sh $HOST_IP
