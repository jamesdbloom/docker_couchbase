#!/bin/bash

# stop all docker containers
docker ps -a | grep -v CONTAINER | awk '{print $1}' | xargs docker stop

# removed all docker containers
docker ps -a | grep -v CONTAINER | awk '{print $1}' | xargs docker rm

# re-build couchbase image
docker build -t jamesdbloom/couchbase /vagrant

# run first node
docker run --name couch_one -i -t -d -p 11210:11210 -p 8091:8091 -p 8092:8092 -e CLUSTER_INIT_USER=Administrator -e CLUSTER_INIT_PASSWORD=password -e SAMPLE_BUCKETS=\"beer-sample\" jamesdbloom/couchbase

# ensure its started
sleep 20

# run second node
docker run --name couch_two -i -t -d --link couch_one:couchbase -e CLUSTER_INIT_USER=Administrator -e CLUSTER_INIT_PASSWORD=password jamesdbloom/couchbase