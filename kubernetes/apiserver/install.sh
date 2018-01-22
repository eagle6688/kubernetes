#!/bin/sh
. /home/service/devutility.shell/tools.sh

volume_srvkube=/srv/kubernetes
volume_etcssl=/etc/ssl

create_dir $volume_srvkube
create_dir $volume_etcssl

kubectl create -f apiserver.json