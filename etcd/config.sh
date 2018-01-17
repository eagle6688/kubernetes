#Step 1. open ports 2379 and 2380
sudo firewall-cmd --zone=public --add-port=2379/tcp --permanent
sudo firewall-cmd --zone=public --add-port=2380/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

#Step 2. create data folder for etcd
sudo mkdir -p  /var/data/etcd

#Step 3. install etcd
sudo yum install -y etcd

#Step 4. Write start script
sudo cp -f etcd.4450.service /usr/lib/systemd/system/etcd.service
sudo cp -f etcd.510.service /usr/lib/systemd/system/etcd.service
sudo cp -f etcd.310.service /usr/lib/systemd/system/etcd.service

sudo -cp -f etcd.4450.conf /etc/etcd/etcd.conf
sudo -cp -f etcd.510.conf /etc/etcd/etcd.conf
sudo -cp -f etcd.310.conf /etc/etcd/etcd.conf

#Step 5. enable etcd service
sudo systemctl enable etcd.service
sudo systemctl daemon-reload
sudo systemctl start etcd.service
sudo systemctl status etcd.service

curl http://10.100.97.236:2379/v2/members -XPOST -H "Content-Type: application/json" -d '{"peerURLs":["http://10.100.97.92:2380"]}'
curl http://10.100.97.236:2379/v2/members -XPOST -H "Content-Type: application/json" -d '{"peerURLs":["http://10.100.97.64:2380"]}'