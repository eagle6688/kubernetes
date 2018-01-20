# Open ports for kubernetes
sudo firewall-cmd --zone=public --add-port=8285/udp --permanent
sudo firewall-cmd --zone=public --add-port=10250/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

# Update /etc/kubernetes/config
sudo cp -f config.4450 /etc/kubernetes/config

# Update /etc/kubernetes/apiserver
sudo cp -f apiserver.4450 /etc/kubernetes/apiserver

# Start all services in master
for SERVICES in etcd kube-apiserver kube-controller-manager kube-scheduler; do
	systemctl restart $SERVICES
	systemctl enable $SERVICES
	systemctl status $SERVICES
done