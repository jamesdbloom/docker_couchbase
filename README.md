## Couchbase Dockerfile

This repository contains a **Dockerfile** that can be used to create a cluster of Couchbase nodes

This **Dockerfile** has been published as a [trusted build](https://registry.hub.docker.com/u/jamesdbloom/couchbase/) to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://registry.hub.docker.com/u/jamesdbloom/couchbase/) from public [Docker Registry](https://index.docker.io/): `docker pull jamesdbloom/couchbase`

### Usage

1. Create first node (with optional sample bucket) `docker run -d --name couch_one -p 11210:11210 -p 8091:8091 -p 8092:8092 -e CLUSTER_INIT_USER=Administrator -e CLUSTER_INIT_PASSWORD=password -e SAMPLE_BUCKETS=\"beer-sample\" jamesdbloom/couchbase`

1. Create second node linked to the first `docker run -d --name couch_two --link couch_one:couchbase -e CLUSTER_INIT_USER=Administrator -e CLUSTER_INIT_PASSWORD=password jamesdbloom/couchbase`
    
[James D Bloom](http://blog.jamesdbloom.com)
