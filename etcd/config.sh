#Step 1. open ports 2379 and 2380
sudo firewall-cmd --zone=public --add-port=2379/tcp --permanent
sudo firewall-cmd --zone=public --add-port=2380/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

#Step 2. create data folder for etcd
sudo mkdir -p  /var/data/etcd

#Step 3. install etcd
sudo yum install -y etcd

#Step 4. substitute configuration file on each node
cp -f etcd.4450.conf /etc/etcd/etcd.conf
cp -f etcd.510.conf /etc/etcd/etcd.conf
cp -f etcd.310.conf /etc/etcd/etcd.conf

#Step 5. Write start script
cp etcd.service /usr/lib/systemd/system/

#Step 6. enable etcd service
sudo systemctl enable etcd.service
sudo systemctl daemon-reload
sudo systemctl start etcd.service