#!/bin/bash
#
# Curl an HTTP endpoint some N number of times at once in the background
#

URL="https://api.publicapis.org/entries"
NUM_OF_REQUESTS=50

# Delete ./results if it exists
[[ -d ./results ]] && rm -rf ./results

# Request output will go under ./results
mkdir results

for ((REQUEST=0; REQUEST<=NUM_OF_REQUESTS; REQUEST++)); do
   nohup curl -v -L "$URL" &> ./results/$REQUEST.txt &
done

watch -n 1 "ps -ef | grep $URL"
