#!/bin/bash
set -e

STEPS=4

FOLDER=$( dirname -- "${BASH_SOURCE[0]}" )

echo "[redis] [1/${STEPS}] Creating PersistentVolume"
kubectl apply -n bigblueswarm -f $FOLDER/persistent-volume.yml

echo "[redis] [2/${STEPS}] Creating ConfigMap"
kubectl apply -n bigblueswarm -f $FOLDER/config-map.yml

echo "[redis] [3/${STEPS}] Creating Statefulset"
kubectl apply -n bigblueswarm -f $FOLDER/statefulset.yml

echo "[redis] [4/${STEPS}] Creating Service"
kubectl apply -n bigblueswarm -f $FOLDER/service.yml
