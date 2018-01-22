#!/bin/sh
. ./apiserver.4450

kubectl run kube-apiserver \
 --image=eagle6688/kube-apiserver:v1.9.2 \
 --port=8080 \
 --replicas=2 \
 --command=true \
 -- kube-apiserver \
 $KUBE_API_ADDRESS \
 $KUBE_API_PORT \
 $KUBELET_PORT \
 $KUBE_ETCD_SERVERS \
 $KUBE_SERVICE_ADDRESSES \
 $KUBE_ADMISSION_CONTROL