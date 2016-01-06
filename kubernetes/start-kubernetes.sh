#!/bin/bash

# start docker daemon
docker daemon > /var/log/docker.log 2>&1 &

# start etcd
etcd --data-dir=/var/etcd/data > /var/log/etcd.log 2>&1 &

# wait for ectd to setup
sleep 5

# start apiserver
kube-apiserver --service-cluster-ip-range=10.0.0.1/24 --insecure-bind-address=0.0.0.0 --etcd_servers=http://127.0.0.1:4001 > /var/log/kube-apiserver.log 2>&1 &

# wait for apiserver to setup
sleep 5

# start controller manager, sheduler, kubelet and proxy
kube-controller-manager --master=http://0.0.0.0:8080 > /var/log/kube-controller-manager.log 2>&1 &
kube-scheduler --master=http://0.0.0.0:8080 > /var/log/kube-scheduler.log 2>&1 &
kubelet --api_servers=http://0.0.0.0:8080 --address=0.0.0.0 --cluster_dns=10.0.0.10 --cluster_domain="kubernetes.local" --pod-infra-container-image="kiwenlau/pause:0.8.0"  > /var/log/kubelet.log 2>&1 &
kube-proxy --master=http://0.0.0.0:8080 > /var/log/kube-proxy.log 2>&1 &

# just keep this script running
while [[ true ]]; do
	sleep 1
done

