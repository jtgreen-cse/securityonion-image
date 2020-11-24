#!/bin/bash

rm -f /tmp/garbage_file
while ! wget -O /tmp/garbage_file --no-check-certificate https://${ELASTICSEARCH_HOST}:9300 2>/dev/null
do
	echo "Waiting for Elasticsearch..."
	rm -f /tmp/garbage_file
	sleep 1
done
rm -f /tmp/garbage_file
sleep 5

# Remove the old PID
rm -f /opt/thehive/RUNNING_PID

/opt/thehive/bin/thehive
