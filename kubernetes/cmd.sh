#===================================================#
# Download
# You will run docker, kubelet, and kube-proxy outside of a container, 
# the same way you would run any system daemon, so you just need the bare binaries. 
# For etcd, kube-apiserver, kube-controller-manager, and kube-scheduler, we recommend that you run these as container,.
#===================================================#

# Test ip forward
sysctl net.ipv4.ip_forward

# Download files
wget https://dl.k8s.io/v1.9.2/kubernetes.tar.gz
wget https://dl.k8s.io/v1.9.2/kubernetes-client-linux-amd64.tar.gz
wget https://dl.k8s.io/v1.9.2/kubernetes-server-linux-amd64.tar.gz
wget https://dl.k8s.io/v1.9.2/kubernetes-node-linux-amd64.tar.gz

#===================================================#
# Master
#===================================================#

# Open ports

sudo firewall-cmd --zone=public --add-port=10250-10252/tcp --permanent
sudo firewall-cmd --zone=public --add-port=10255/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

# Open ports end

# Install Master

cp -rf $HOME/kubernetes/kubernetes/install-param.sh $HOME/downloads
cp -rf $HOME/kubernetes/kubernetes/install-master.sh $HOME/downloads
cd $HOME/downloads
sudo ./install-master.sh

# Install Master end

# Load docker images

cd /usr/local/programes/kubernates/server
docker load -i kube-apiserver.tar
docker load -i kube-controller-manager.tar
docker load -i kube-scheduler.tar

# Load docker images end

# Update /etc/kubernetes/config
sudo cp -f config.4450 /etc/kubernetes/config

# Update /etc/kubernetes/apiserver
sudo cp -f apiserver.4450 /etc/kubernetes/apiserver

kubectl config set-cluster $CLUSTER_NAME --server=http://$MASTER_IP --insecure-skip-tls-verify=true
kubectl config set-cluster "kube-cluster" --server=http://10.100.97.236:8080 --insecure-skip-tls-verify=true
vim $HOME/.kube/config


# Start all services on master
sudo systemctl enable kube-apiserver kube-scheduler kube-controller-manager 
sudo systemctl start kube-apiserver kube-scheduler kube-controller-manager
systemctl status kube-apiserver kube-scheduler kube-controller-manager

# Test configuration on master
curl http://127.0.0.1:8080

#===================================================#
# Node
#===================================================#

# Open ports

sudo firewall-cmd --zone=public --add-port=10250/tcp --permanent
sudo firewall-cmd --zone=public --add-port=10255/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

# Open ports end