# Run a Redis Cluster instance

This cluster instance uses a self-signed server certificate for TLS and requires auth in client connections & replications.

Run commands under the redis-cluster folder unless specified.

## To start

Have some redis node instances left with data and generated configs and lazy to clean them up.
You could alternatively clean up the data folder, which is mounted to the host, or clean the docker instances manually.

```
./start.sh
```

## Test TLS connections

```
redis-cli --cacert ./conf/redis.crt -c -u rediss://secret@localhost:7001 cluster nodes
redis-cli --cacert ./conf/redis.crt -c --tls -h localhost -p 7001 -a secret cluster nodes
```

## To stop and clean up
```
./stop.sh
```
