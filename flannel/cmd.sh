#Install flannel on CentOS
sudo yum install -y flannel

#Add configuration in etcd
etcdctl put /coreos.com/network/config '{ "Network": "172.17.0.0/16" }'
curl -X PUT http://127.0.0.1:2379/v2/keys/coreos.com/network/config -d value='{ "Network": "172.17.0.0/16" }'

#Open ports 8285
sudo firewall-cmd --zone=public --add-port=8285/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

#Create log directory
sudo mkdir -p /var/log/flannel

#Replace flanneld
sudo cp -f flanneld.4450 /etc/sysconfig/flanneld

#Start
sudo systemctl daemon-reload
sudo systemctl start flanneld
sudo systemctl status flanneld