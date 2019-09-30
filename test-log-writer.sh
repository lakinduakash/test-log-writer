#!/bin/bash

if [ $# -ne 3 ]
  then
    echo -e "Not enough argments.\ncommand <max-log-count> <interval> <filename>"
    exit 1
fi

LOG_START="TID: [-1234] [] ["
count=$1
interval=$2
filename=$3

array[0]="]  INFO {org.wso2.carbon.consent.mgt.core.internal.ConsentManagerComponent} -  ConsentManagerComponent is activated."
array[1]="]  INFO {org.wso2.carbon.databridge.receiver.binary.internal.BinaryDataReceiver} -  Started Binary SSL Transport on port : 9711"
array[2]="]  WARN {org.wso2.carbon.andes.internal.QpidServiceComponent} -  MQTT Transport is disabled as per configuration."

size=${#array[@]}
index=$(($RANDOM % $size))

echo "Writing sample logs"

for (( c=1; c<=$count; c++ ))
do
   index=$(($RANDOM % $size))
   c_d=$(date +"%Y-%m-%d %H:%M:%S,%3N")
   LOG_LINE=${LOG_START}${c_d}${array[$index]}
   echo $LOG_LINE >> $filename
   sleep $interval
done
