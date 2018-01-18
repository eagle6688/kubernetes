#!/bin/sh

name="default"
data_dir="/var/data/etcd"
listen_peer_urls="http://0.0.0.0:2380"
listen_client_urls="http://0.0.0.0:2379"

initial_adverties_peer_urls="http://127.0.0.1:2380"
advertise_client_urls="http://127.0.0.1:2379"
initial_cluster="default=http://127.0.0.1:2380"
initial_cluster_token="etcd-cluster"
initial_cluster_state="new"

if [ "$ETCD_NAME" ]
then
    name="$ETCD_NAME"
    echo "Detected new ETCD_NAME value of $name"
else
    echo "Using default ETCD_DATA_DIR: $name"
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

if [ "$ETCD_LISTEN_PEER_URLS" ]
then
    listen_peer_urls=$ETCD_LISTEN_PEER_URLS
    echo "Detected new ETCD_LISTEN_PEER_URLS value of $listen_peer_urls"
else
    echo "Using default ETCD_LISTEN_PEER_URLS: $listen_peer_urls"
fi

if [ "$ETCD_LISTEN_CLIENT_URLS" ]
then
    listen_client_urls=$ETCD_LISTEN_CLIENT_URLS
    echo "Detected new ETCD_LISTEN_CLIENT_URLS value of $listen_client_urls"
else
    echo "Using default ETCD_LISTEN_CLIENT_URLS: $listen_client_urls"
fi

if [ "$ETCD_INITIAL_ADVERTISE_PEER_URLS" ]
then
    initial_adverties_peer_urls=$ETCD_INITIAL_ADVERTISE_PEER_URLS
    echo "Detected new ETCD_INITIAL_ADVERTISE_PEER_URLS value of $initial_adverties_peer_urls"
else
    echo "Using default ETCD_INITIAL_ADVERTISE_PEER_URLS: $initial_adverties_peer_urls"
fi

if [ "$ETCD_ADVERTISE_CLIENT_URLS" ]
then
    advertise_client_urls=$ETCD_ADVERTISE_CLIENT_URLS
    echo "Detected new ETCD_ADVERTISE_CLIENT_URLS value of $advertise_client_urls"
else
    echo "Using default ETCD_ADVERTISE_CLIENT_URLS: $advertise_client_urls"
fi

if [ "$ETCD_INITIAL_CLUSTER" ]
then
    initial_cluster=$ETCD_INITIAL_CLUSTER
    echo "Detected new ETCD_INITIAL_CLUSTER value of $initial_cluster"
else
    echo "Using default ETCD_INITIAL_CLUSTER: $initial_cluster"
fi

if [ "$ETCD_INITIAL_CLUSTER_TOKEN" ]
then
    initial_cluster_token=$ETCD_INITIAL_CLUSTER_TOKEN
    echo "Detected new ETCD_INITIAL_CLUSTER_TOKEN value of $initial_cluster_token"
else
    echo "Using default ETCD_INITIAL_CLUSTER_TOKEN: $initial_cluster_token"
fi

if [ "$ETCD_INITIAL_CLUSTER_STATE" ]
then
    initial_cluster_state=$ETCD_INITIAL_CLUSTER_STATE
    echo "Detected new ETCD_INITIAL_CLUSTER_STATE value of $initial_cluster_state"
else
    echo "Using default ETCD_INITIAL_CLUSTER_STATE: $initial_cluster_state"
fi

echo "Startup the service..."

/usr/bin/etcd \
 --name $name \
 --data-dir $data_dir \
 --listen-peer-urls $listen_peer_urls \
 --listen-client-urls $listen_client_urls \
 --initial-advertise-peer-urls $initial_adverties_peer_urls \
 --initial-cluster $initial_cluster \
 --initial-cluster-state $initial_cluster_state \
 --initial-cluster-token $initial_cluster_token \
 --advertise-client-urls $advertise_client_urls