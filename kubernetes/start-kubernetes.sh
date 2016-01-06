#!/bin/bash

etcd --data-dir=/var/etcd/data > /tmp/etcd.log 2>&1 &

# wait for ectd to setup
sleep 5

kube-apiserver --service-cluster-ip-range=10.0.0.1/24 --insecure-bind-address=0.0.0.0 --etcd_servers=http://127.0.0.1:4001 > /tmp/kube-apiserver.log 2>&1 &

# wait for apiserver to setup
sleep 5

kube-controller-manager --master=http://0.0.0.0:8080 > /tmp/kube-controller-manager.log 2>&1 &
kube-scheduler --master=http://0.0.0.0:8080 > /tmp/kube-scheduler.log 2>&1 &
kubelet --api_servers=http://0.0.0.0:8080 --address=0.0.0.0 --cluster_dns=10.0.0.10 --cluster_domain="kubernetes.local" --pod-infra-container-image="kiwenlau/pause:0.8.0"  > /tmp/kubelet.log 2>&1 &
kube-proxy --master=http://0.0.0.0:8080 > /tmp/kube-proxy.log 2>&1 &

bash
