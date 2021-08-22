#!/bin/bash

echo ' - Apply tools istio'
cd ~/istio-1.11.0
export PATH=$PWD/bin:$PATH

echo ' - Install tools istio'
kubectl apply -f samples/addons/prometheus.yaml
kubectl apply -f samples/addons/grafana.yaml
kubectl apply -f samples/addons/kiali.yaml

echo ' - Start Kiali'
istioctl dashboard kiali &> /dev/null &

echo ' - Start Prometheus'
istioctl dashboard prometheus &> /dev/null &

echo ' - Start Grafana'
istioctl dashboard grafana &> /dev/null &

echo 'OK!'