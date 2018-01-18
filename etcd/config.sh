#Step 1. open ports 2379 and 2380
sudo firewall-cmd --zone=public --add-port=2379/tcp --permanent
sudo firewall-cmd --zone=public --add-port=2380/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

#Step 2. install etcd
sudo yum install -y etcd

#Step 3. copy script
sudo cp -f etcd.service /usr/lib/systemd/system/etcd.service

sudo cp -f etcd.4450.conf /etc/etcd/etcd.conf
sudo cp -f etcd.510.conf /etc/etcd/etcd.conf
sudo cp -f etcd.310.conf /etc/etcd/etcd.conf

sudo cp -f etcd.bootstrap.sh /etc/etcd/etcd.bootstrap.sh
sudo chmod +x /etc/etcd/etcd.bootstrap.sh

#Step 4. enable etcd service
sudo systemctl enable etcd.service
sudo systemctl daemon-reload
sudo systemctl start etcd.service
sudo systemctl status etcd.service

#Step 4. add members
curl http://10.100.97.236:2379/v2/members -XPOST -H "Content-Type: application/json" -d '{"peerURLs":["http://10.100.97.92:2380"]}'
curl http://10.100.97.236:2379/v2/members -XPOST -H "Content-Type: application/json" -d '{"peerURLs":["http://10.100.97.81:2380"]}'