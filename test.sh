#!/usr/bin/env bash

# Check for broken links
bundle exec middleman server &
SERVER_PID=$!
sleep 3 # wait for server startup

wget --spider -r -nd -nv \
     -H -D localhost -Dfreifunk-duesseldorf.de --exclude-domains map.freifunk-duesseldorf.de \
     -p -w 1 -e robots=off http://localhost:4567/
WGET_EXIT_CODE=$?

kill ${SERVER_PID}
sleep 1 # wait for server exit

exit ${WGET_EXIT_CODE}