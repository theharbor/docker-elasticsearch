#!/bin/bash

usage() {
	echo "Usage:" 2>&1
	echo "" 2>&1
	echo "shell              -- Start an interactive shell" 2>&1
	echo "elasticsearch      -- Start elasticsearch" 2>&1
}

case $1 in
	"shell")
		exec /bin/bash
		;;
	"elasticsearch")
		test -e /var/lib/elasticsearch || mkdir /var/lib/elasticsearch
		chown --recursive --changes elasticsearch:elasticsearch /var/lib/elasticsearch
		runas elasticsearch /usr/share/elasticsearch/bin/elasticsearch  \
			--default.config=/etc/elasticsearch/elasticsearch.yml  \
			--default.path.home=/usr/share/elasticsearch/  \
			--default.path.logs=/var/log/elasticsearch/  \
			--default.path.data=/var/lib/elasticsearch/  \
			--default.path.work=/tmp/elasticsearch/  \
			--default.path.conf=/etc/elasticsearch/
		exit 1
		;;
	*)
		usage
		exit 1
		;;
esac
