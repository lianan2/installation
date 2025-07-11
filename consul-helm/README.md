# 1 helm安装consul

## 安装
values.yaml为默认配置, 要修改的配置写在了config.yaml中

Step1: 确认集群是否有sc, 若没有则创建:
```shell
kubectl apply -f templates/sc_pv_pvc/nfs-storageclass.yaml 
```

Step2: 创建一个consul的pv:
```shell
kubectl apply -f templates/sc_pv_pvc/consul-pv.yaml
```

Step3: 开始部署
```shell
helm install -n consul consul . -f config.yaml --create-namespace
```

## 卸载
```shell
helm uninstall -n consul consul --no-hooks
kubectl delete pv consul-pv
```

# 2 常用命令
## 查看consul集群状态
```shell
# 查看集群状态
kubectl -n consul exec -it consul-server-0 -- consul operator raft list-peers
kubectl -n consul exec -it consul-server-0 -- consul members

# 查看service状态
kubectl -n consul get endpoints consul-server

# 测试dns
kubectl -n consul exec -it consul-server-0 -- nslookup consul-server.consul.svc.cluster.local
```

## 服务注册
```shell
# 手动注册一个服务
kubectl -n consul exec consul-server-0 -- consul services register \
  -name="test-service" \
  -address="10.244.0.36" \
  -port=9210 \
  -tag="test"

# 查看已注册的服务
kubectl -n consul exec -it consul-server-0 -- consul catalog services
kubectl -n consul exec -it consul-server-0 -- curl http://127.0.0.1:8500/v1/health/service/test-service?pretty

# 注销服务
kubectl -n consul exec consul-server-0 -- consul services deregister -id=test-service
```

## 服务发现
```shell
# 进入任意一个 pod 
kubectl -n my-apps exec -it test-service-7c4675ff54-t26mx -- sh

# 测试 dns
nslookup consul-server.consul.svc.cluster.local

# 通过服务发现访问服务，访问地址为：
consul-server.consul.svc.cluster.local:8500/test-service?wait=3s
```