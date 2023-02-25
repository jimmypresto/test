#!/bin/bash

docker stop $(docker ps -qf 'name=redis-cluster*')
rm -f data/*/*.{rdb,conf}
rm -f data/*/redis.*
rm -rf data/*/appendonlydir*
