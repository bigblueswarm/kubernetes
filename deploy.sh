#!/bin/bash
set -e

CLUSTERED_SUFIX=""

if [[ $* == *-c* ]]
then 
  CLUSTERED_SUFIX="-cluster"
fi

kubectl apply -f namespace.yml
kubectl apply -f storage-class.yml

/bin/bash ./redis$CLUSTERED_SUFIX/deploy.sh
/bin/bash ./influxdb/deploy.sh
/bin/bash ./bigblueswarm/deploy.sh
