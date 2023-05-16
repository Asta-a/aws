#!/bin/bash

nohup /root/k_server &

while true
do
        LOG_FILE="/root/server.log"
        SEARCH_STRING="NicheID:"
        last_line=$(grep ${SEARCH_STRING} ${LOG_FILE}|tail -n 1)
        IFS='NicheID:' read -ra arr <<< "$last_line"
        key=${arr[-1]}
        echo curl -i -H \"Accept:application/json\" -X POST -d \'\{\"UserId\":7,\"GameId\":26,\"NicheId\":\"$key\"\}\' http://101.43.14.68:8888/niche/put
        sleep 5
done
