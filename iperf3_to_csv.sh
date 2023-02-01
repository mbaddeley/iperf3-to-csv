#!/bin/bash

# Author: Michael Baddeley
# Date:   01/02/23
#
# Usage:  iperf3 -c localhost -t 5 | bash iperf3_to_csv.sh 200 20 random output_200_20_random.csv

echo "distance,velocity,movement,interval,transfer,bitrate,retr,cwnd" >> $4

lines=()
while read line
do
  lines+=("$line")
done

num_lines=${#lines[@]}
for ((i=0; i < num_lines - 4; i++))
do
  line=${lines[$i]}
  if [[ $line =~ \[.*5\] ]] && ! [[ $line =~ \[.*5\]\ local ]]
  then
    interval=$(echo $line | awk '{split($3, arr, "-"); print arr[2]}')
    transfer=$(echo $line | awk '{print $5}')
    bitrate=$(echo $line | awk '{print $7}')
    retr=$(echo $line | awk '{print $9}')
    cwnd=$(echo $line | awk '{print $10}')
    echo "$1,$2,$3,$interval,$transfer,$bitrate,$retr,$cwnd" >> $4
  fi
done

