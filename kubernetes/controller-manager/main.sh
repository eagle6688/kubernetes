#!/bin/sh
dir_kube=/usr/local/programes/kubernetes
dir_kube_services="$dir_kube/services"

. $dir_kube_services/config
. $dir_kube_services/controller-manager/config

$dir_kube/server/kube-controller-manager \
 $KUBE_LOGTOSTDERR \
 $KUBE_LOG_LEVEL \
 $KUBE_MASTER \
 $KUBE_LEADER_ELECT