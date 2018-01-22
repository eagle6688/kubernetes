#!/bin/sh
. ./install-param.sh
. $dir_home/devutility.shell/tools.sh

server_file=kubernetes-server-linux-amd64.tar.gz
server_files=kubernetes/server/bin/*
dir_install_server=$dir_install/server

# Check files

check_file "$server_file"
check_server_result=$?

if [[ $check_server_result != 0 ]]
then
    exit 1;
fi

# Check files end

# Install

echo "Extract $server_file to current directory..."
tar -xzvf $server_file
create_dir "$dir_install_server"
move "$server_files" "$dir_install_server"
remove kubernetes

executable_file "$dir_install_server/kubelet"
executable_file "$dir_install_server/kube-proxy"
executable_file "$dir_install_server/kube-apiserver"
executable_file "$dir_install_server/kube-controller-manager"
executable_file "$dir_install_server/kube-scheduler"

copytodir "$dir_gitlocal_kubernetes/config" "$dir_install_service/"
copytodir "$dir_gitlocal_kubernetes/apiserver" "$dir_install_service/"
copytodir "$dir_gitlocal_kubernetes/controller-manager" "$dir_install_service/"
copytodir "$dir_gitlocal_kubernetes/scheduler" "$dir_install_service/"

# Install end

echo "The $server_file has been installed completely!"