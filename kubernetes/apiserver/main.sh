#!/bin/sh
dir_kube=/usr/local/programes/kubernetes
dir_kube_services="$dir_kube/services"

. $dir_kube_services/config
. $dir_kube_services/apiserver/config

$dir_kube/server/kube-apiserver \
 $KUBE_LOGTOSTDERR \
 $KUBE_LOG_LEVEL \
 $KUBE_ALLOW_PRIV \
 $KUBE_MASTER \

 $KUBE_API_ADDRESS \
 $KUBE_API_PORT \
 $KUBELET_PORT \
 $KUBE_ETCD_SERVERS \
 $KUBE_SERVICE_ADDRESSES \
 $KUBE_ADMISSION_CONTROL

 /usr/local/programes/kubernetes/server/kube-apiserver \
  --token-auth-file=/dev/null \
  --insecure-bind-address=127.0.0.1
  --advertise-address=