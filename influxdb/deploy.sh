#!/bin/bash
set -e

echo "==== For a clustered version of InfluxDB, please use the influxdb enterprise edition ===="

STEPS=5

FOLDER=$( dirname -- "${BASH_SOURCE[0]}" )

echo "[influxdb] [1/${STEPS}] Creating PersistentVolume"
kubectl apply -f $FOLDER/persistent-volume.yml

echo "[influxdb] [2/${STEPS}] Creating Secret"
kubectl apply -f $FOLDER/secret.yml

echo "[influxdb] [2/${STEPS}] Creating ConfigMap"
kubectl apply -f $FOLDER/config-map.yml

echo "[influxdb] [3/${STEPS}] Creating Statefulset"
kubectl apply -f $FOLDER/statefulset.yml

echo "[influxdb] [4/${STEPS}] Creating Service"
kubectl apply -f $FOLDER/service.yml
