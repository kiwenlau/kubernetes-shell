#!/bin/bash

# echo -e "\nbuild kubernetes image."
# cd kubernetes
# sudo docker build -t kiwenlau/kubernetes-shell:1.0.7 .

docker rm -f kubernetes > /dev/null

echo -e "\nstart kubernetes container"
docker run -it -d --privileged -v /var/run/docker.sock:/var/run/docker.sock --name=kubernetes kiwenlau/kubernetes-shell:1.0.7 

# wait for kubenetes to setup
sleep 10
echo "start kubernetes successfully"