#!/bin/sh
. ./apiserver.4450

docker run -it -p 8080:8080 --name kube-apiserver eagle6688/kube-apiserver:v1.9.2 \
 kube-apiserver \
 $KUBE_API_ADDRESS \
 $KUBE_API_PORT \
 $KUBELET_PORT \
 $KUBE_ETCD_SERVERS \
 $KUBE_SERVICE_ADDRESSES \
 $KUBE_ADMISSION_CONTROL