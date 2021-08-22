#!/bin/bash

kubectl apply -f k8s/istio-gateway-deployment.yml
kubectl apply -f packages/nextjs-blog/k8s/deployment.yml
kubectl apply -f packages/react-app/k8s/deployment.yml
kubectl apply -f packages/vue-app/k8s/deployment.yml

echo 'OK!'