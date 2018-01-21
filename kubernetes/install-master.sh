#!/bin/sh
. ./install-param.sh
. $HOME/devutility.shell/tools.sh

dir_install_server=$dir_intall/server
server_file=kubernetes-server-linux-amd64.tar.gz
server_files=kubernetes/server/bin/*

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
echo "The $server_file has been installed completely!"

# Install end