#!/bin/bash

nohup /root/k_server &
old=''
key=''
str='NicheID'
while true; do
    last_line=$(tail -n 1 /root/server.log | tail -n 1)
    if [[ "$last_line" != *"$str"* ]] && [[ "$key"!="$old" ]]; then
        IFS='NicheID:' read -ra arr <<< "$last_line"
        key=${arr[-1]}
        echo "$key"
        curl -i -H 'Accept:application/json' -X POST -d '{"UserId":9,"GameId":13,"NicheId":"'$key'"}' http://101.43.14.68:8888/niche/put
        old=$key
    fi
    sleep 1
done
