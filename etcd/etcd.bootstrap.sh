#!/bin/sh

name
data_dir=/var/data/etcd
listen_peer_urls=http://0.0.0.0:2380
listen_client_urls=http://0.0.0.0:2379

initial_adverties_peer_urls
advertise_client_urls
initial_cluster
initial_cluster_token
initial_cluster_state

if [ "$ETCD_NAME" ]
then
    name="$ETCD_NAME"
    echo "Detected new ETCD_NAME value of $name"
else
    echo "Need ETCD_NAME"
    exit 1
fi

if [ "$ETCD_DATA_DIR" ]
then
    data_dir=$ETCD_DATA_DIR
    echo "Detected new ETCD_DATA_DIR value of $data_dir"
else
    echo "Using default ETCD_DATA_DIR: $data_dir"
fi

if [ ! -d "$data_dir" ]
then
    /bin/mkdir "$data_dir"
fi







if [ -z ${ADVERTISE_URLS+x} ]
then
        ADVERTISE_URLS="http://0.0.0.0:2380"
        echo "Using default ADVERTISE_URLS ($ADVERTISE_URLS)"
else
        echo "Detected new ADVERTISE_URLS value of $ADVERTISE_URLS"
fi

ETCD_CMD="/bin/etcd --data-dir='/data' --advertise-client-urls=${ADVERTISE_URLS} --listen-client-urls=${LISTEN_URLS} $*"
echo -e "Running '$ETCD_CMD'\nBEGIN ETCD OUTPUT\n"

exec $ETCD_CMD