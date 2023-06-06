#!/bin/bash
set -e

STEPS=6

FOLDER=$( dirname -- "${BASH_SOURCE[0]}" )

echo "[bigblueswarm] [1/${STEPS}] Creating ConfigMap"
kubectl apply -f $FOLDER/config-map.yml

echo "[bigblueswarm] [2/${STEPS}] Creating Statefulset"
kubectl apply -f $FOLDER/statefulset.yml

echo "[bigblueswarm] [3/${STEPS}] Adding autoscaler"
kubectl apply -f $FOLDER/autoscaler.yml

echo "[bigblueswarm] [4/${STEPS}] Creating Service"
kubectl apply -f $FOLDER/service.yml

echo "[bigblueswarm] [5/${STEPS}] Adding Nginx Ingress Controller"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.0/deploy/static/provider/cloud/deploy.yaml

echo "[bigblueswarm] [6/${STEPS}] Adding ingress"
kubectl apply -f $FOLDER/ingress.yml
