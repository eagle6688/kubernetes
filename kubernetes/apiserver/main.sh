#!/bin/sh
dir_kube_services=/usr/local/programes/kubernetes/services

. $dir_kube_services/config
. $dir_kube_services/apiserver/config

kube-apiserver \
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