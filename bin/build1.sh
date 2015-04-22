#!/bin/bash

set -e
set -x

apt-get update
apt-get install --no-install-recommends -y ca-certificates curl

curl --silent --show-error --location https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elasticsearch.org/elasticsearch/${ELASTICSEARCH_MAJOR_VERSION}/debian stable main" > /etc/apt/sources.list.d/elasticsearch.list

apt-get update
apt-get install --no-install-recommends -y elasticsearch

rm -rf /var/lib/apt/lists/*
