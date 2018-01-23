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
 --insecure-bind-address=0.0.0.0 \
 --insecure-port=8080 \
 --advertise-address=10.100.97.236 
 --secure-port=0 \
 --etcd-servers=http://10.100.97.236:2379,http://10.100.97.92:2379,http://10.100.97.81:2379 \
 --service-cluster-ip-range=10.254.0.0/16 \
 --admission-control=NamespaceLifecycle,NamespaceExists,LimitRanger,ResourceQuota