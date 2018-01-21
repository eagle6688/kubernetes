#!/bin/sh
dir_ln=/usr/local/bin
dir_intall=/usr/local/programes/kubernates
dir_client=$dir_intall/client
dir_server=$dir_intall/server
client_file=kubernetes-client-linux-amd64.tar.gz
server_file=kubernetes-server-linux-amd64.tar.gz

function check_file(){
    local -r file="$1"

    if [ ! -e "$file" ]
    then
        echo "$file not found!"
        return 1;
    fi

    return 0;
}

function create_dir(){
    local -r dir="$1"

    if [ ! -d "$dir" ]
    then
        mkdir -p "$dir"
        echo "Create directory $dir"
    fi
}

function extract_file(){
    local -r file="$1"
    local -r targetDir="$2"
    local -r gzDeep=$3
    
    create_dir $targetDir
    tar -xzf "${file}" --strip-components $gzDeep -C "${targetDir}"
    echo "Extract $file to $targetDir"
}

function ln_file(){
    local -r file="$1"
    local -r target="$2"
    ln -sf "$file" "$target"
    echo "Create a soft link from $file to $target"
}

function executable_file(){
    local -r file="$1"
    chmod +x $file
    echo "Make $file executable"
}

# Check files

check_file "$client_file"
check_client_result=$?

check_file "$server_file"
check_server_result=$?

if [[ $check_client_result != 0 || $check_server_result != 0 ]]
then
    exit 1;
fi

# Check files end

echo "We will install kubernates in ${dir_intall}"

# Install client
extract_file $client_file $dir_client 3
executable_file "${dir_client}/kubectl"
ln_file "${dir_client}/kubectl" "${dir_ln}/kubectl"