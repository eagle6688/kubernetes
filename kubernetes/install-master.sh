#!/bin/sh
. ./install-param.sh
. $dir_root/devutility.shell/tools.sh

server_file=kubernetes-server-linux-amd64.tar.gz
server_files=kubernetes/server/bin/*

# ENV for local git

dir_gitlocal_kubernates_apiserver=$dir_gitlocal_kubernates/apiserver
dir_gitlocal_kubernates_controller_manager=$dir_gitlocal_kubernates/controller-manager
dir_gitlocal_kubernates_scheduler=$dir_gitlocal_kubernates/scheduler

# ENV for local git end

# ENV for install directories

dir_install_server=$dir_intall/server

# ENV for install directories end

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

move "$dir_gitlocal_kubernates/config" "$dir_options/config"
move "$dir_gitlocal_kubernates_apiserver/config" "$dir_options/apiserver"
move "$dir_gitlocal_kubernates_controller_manager/config" "$dir_options/controller-manager"
move "$dir_gitlocal_kubernates_scheduler/config" "$dir_options/scheduler"

move "$dir_gitlocal_kubernates_apiserver/kube-apiserver.service" "$dir_systemd/kube-apiserver.service"
move "$dir_gitlocal_kubernates_controller_manager/kube-controller-manager.service" "$dir_systemd/kube-controller-manager.service"
move "$dir_gitlocal_kubernates_scheduler/kube-scheduler.service" "$dir_systemd/kube-scheduler.service"

# Install end

echo "The $server_file has been installed completely!"