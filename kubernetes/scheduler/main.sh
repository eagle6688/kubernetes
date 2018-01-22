#!/bin/sh
dir_kube_services=/usr/local/programes/kubernetes/services

. $dir_kube_services/config
. $dir_kube_services/scheduler/config

kube-controller-manager \
 $KUBE_LOGTOSTDERR \
 $KUBE_LOG_LEVEL \
 $KUBE_MASTER \
 $KUBE_LEADER_ELECT