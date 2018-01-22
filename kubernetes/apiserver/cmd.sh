docker run -it -p 8080:8080 --name kube-apiserver eagle6688/kube-apiserver:v1.9.2 \
 kube-apiserver \
 --insecure-bind-address=0.0.0.0 \
 --port=8080 \
 --kubelet-port=10250 \
 --etcd-servers=http://10.100.97.236:2379 \
 --service-cluster-ip-range=10.254.0.0/16 \
 --admission-control="NamespaceLifecycle,NamespaceExists,LimitRanger,SecurityContextDeny,ServiceAccount,ResourceQuota"