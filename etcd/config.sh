#Step 1. open ports 2379 and 2380
sudo firewall-cmd --zone=public --add-port=2379/tcp --permanent
sudo firewall-cmd --zone=public --add-port=2380/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

#Step 2. create data folder for etcd
sudo mkdir -p  /var/data/etcd

#Step 3. install etcd
sudo yum install -y etcd

#Step 3. substitute configuration file on each node
mv -f etcd.k4450.conf /etc/etcd/etcd.conf
