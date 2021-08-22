#!/bin/bash

echo ' - Download istio'
cd ~/
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.11.0 TARGET_ARCH=x86_64 sh -

echo ' - Exporting istio bin'
cd ~/istio-1.11.0
export PATH=$PWD/bin:$PATH

echo ' - Install istio profile'
istioctl install --set profile=demo -y

echo ' - Inject istio default namespace in cluster'
kubectl label namespace default istio-injection=enabled --overwrite