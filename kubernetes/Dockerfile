FROM kiwenlau/kubernetes:1.0.7

MAINTAINER kiwenlau <kiwenlau@gmail.com>

WORKDIR /root

# install etcd
RUN wget --no-check-certificate  https://github.com/coreos/etcd/releases/download/v2.2.3/etcd-v2.2.3-linux-amd64.tar.gz && \
    tar xzvf etcd-v2.2.3-linux-amd64.tar.gz && \
    cp etcd-v2.2.3-linux-amd64/etcd* /usr/local/bin && \
    rm -rf etcd-v2.2.3-linux-amd64.tar.gz etcd-v2.2.3-linux-amd64

ADD start-kubernetes.sh /usr/local/bin/start-kubernetes.sh

CMD ["start-kubernetes.sh"]

# sudo docker build -t kiwenlau/kubernetes-shell:1.0.7 

