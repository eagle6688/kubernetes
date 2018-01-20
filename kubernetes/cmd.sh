#===================================================#
# Master
#===================================================#

# Install kubectl binary via curl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.9.2/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Test ip forward
sysctl net.ipv4.ip_forward

chmod +x kubernetes/cluster/get-kube-binaries.sh

kubernetes/cluster/get-kube-binaries.sh

#===================================================#
# Master
#===================================================#

# Download files
wget https://dl.k8s.io/v1.9.2/kubernetes.tar.gz
wget https://dl.k8s.io/v1.9.2/kubernetes-client-linux-amd64.tar.gz
wget https://dl.k8s.io/v1.9.2/kubernetes-server-linux-amd64.tar.gz

# Open ports for kubernetes
sudo firewall-cmd --zone=public --add-port=10250-10252/tcp --permanent
sudo firewall-cmd --zone=public --add-port=10255/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

# Update /etc/kubernetes/config
sudo cp -f config.4450 /etc/kubernetes/config

# Update /etc/kubernetes/apiserver
sudo cp -f apiserver.4450 /etc/kubernetes/apiserver

# Start all services on master
sudo systemctl enable kube-apiserver kube-scheduler kube-controller-manager 
sudo systemctl start kube-apiserver kube-scheduler kube-controller-manager
systemctl status kube-apiserver kube-scheduler kube-controller-manager

# Test configuration on master
curl http://127.0.0.1:8080

#===================================================#
# Node
#===================================================#

# Download files
wget https://dl.k8s.io/v1.9.2/kubernetes.tar.gz
wget https://dl.k8s.io/v1.9.2/kubernetes-client-linux-amd64.tar.gz
wget https://dl.k8s.io/v1.9.2/kubernetes-node-linux-amd64.tar.gz

# Open ports for kubernetes
sudo firewall-cmd --zone=public --add-port=10250/tcp --permanent
sudo firewall-cmd --zone=public --add-port=10255/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

