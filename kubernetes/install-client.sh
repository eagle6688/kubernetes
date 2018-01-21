#!/bin/sh
. ./install-param.sh
. $HOME/devutility.shell/tools.sh

dir_install_client=$dir_intall/client
client_file=kubernetes-client-linux-amd64.tar.gz

# Check files

check_file "$client_file"
check_client_result=$?

if [[ $check_client_result != 0 ]]
then
    exit 1;
fi

# Check files end

# Install

extract_file $client_file $dir_install_client 3
executable_file "${dir_install_client}/kubectl"
ln_file "${dir_install_client}/kubectl" "${dir_ln}/kubectl"
echo "The $client_file has been installed completely!"

# Install end