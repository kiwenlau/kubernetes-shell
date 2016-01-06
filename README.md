##运行步骤

1.克隆GitHub仓库

```
git clone https://github.com/kiwenlau/kubernetes-shell
cd kubernetes-shell/
```

2.下载Docker镜像

```
sudo docker pull kiwenlau/kubernetes-shell:1.0.7
```

3.运行Kubernetes

```
chmod +x run.sh
./run.sh
```

kubernetes容器启动时间需要10秒。运行成功后直接进入了kubernetes容器。

4.测试kubernetes

```
./test-kubernetes.sh 
```

该测试将创建一个pod，运行nginx




