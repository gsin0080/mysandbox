#!/bin/bash
check_window=10

for i in {1..6}
do
    VAR=$(sudo docker stats --no-stream sandy-reverse |tail -1)
    NOW=$(date)
    echo -e "${NOW}\t${VAR}"
    sleep $check_window
done
