#!/bin/sh
. ../config
. ./config

 kube-apiserver \
  $KUBE_API_ADDRESS \
  $KUBE_API_PORT \
  $KUBELET_PORT \
  $KUBE_ETCD_SERVERS \
  $KUBE_SERVICE_ADDRESSES \
  $KUBE_ADMISSION_CONTROL