#!/bin/bash

for i in 1 2 3 4 5 6; do 
    NODE_CONF=/conf/node-$((i)).conf
    NODE_DIR=/data/node-$((i))
    cp -f $NODE_CONF $NODE_DIR/redis.conf
    cp -f /conf/redis.key $NODE_DIR
    cp -f /conf/redis.crt $NODE_DIR
    cd $NODE_DIR
    redis-server redis.conf --save "" --appendonly no --maxmemory 2mb &
done

NODE_IP=127.0.0.1
redis-cli --cluster create \
  $NODE_IP:7001 \
  $NODE_IP:7002 \
  $NODE_IP:7003 \
  $NODE_IP:7004 \
  $NODE_IP:7005 \
  $NODE_IP:7006 \
  -a secret \
  --tls \
  --key /conf/redis.key \
  --cert /conf/redis.crt \
  --cacert /conf/redis.crt \
  --cluster-replicas 1 \
  --cluster-yes &

while :
do
	sleep 1
done