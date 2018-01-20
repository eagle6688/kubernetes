#!/bin/sh
dir_intall=/usr/local/programes/kubernates
dir_client=$dir_intall/client
dir_server=$dir_intall/server
client_file=kubernetes-client-linux-amd64.tar.gz
server_file=kubernetes-server-linux-amd64.tar.gz

if [ $(check_file "$client_file") == 1 || $(check_file "$server_file") == 1 ]
then
    exit(1)
fi

echo "We will install kubernates in $dir_intall"

if [ ! -d "$dir_intall" ]
then
    mkdir -p "$dir_intall"
fi

if [ ! -d "$dir_client" ]
then
    mkdir -p "$dir_client"
fi

if [ ! -d "$dir_server" ]
then
    mkdir -p "$dir_server"
fi

function check_file(){
    local -r file="$1"

    if [ ! -e "$file" ]
    then
        echo "$file not found!"
        return 1;
    fi

    return 0;
}