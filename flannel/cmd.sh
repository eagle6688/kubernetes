#Step 1. open ports 8285
sudo firewall-cmd --zone=public --add-port=8285/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

#Create log directory
sudo mkdir -p /var/log/flannel