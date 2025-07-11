# helm部署rocketmq 

部署：
```
sh run.sh
```

访问dashboard（账号admin/admin)
```
http://{ADDRESS}:38080/
```

连接rocketmq:  
```
http连接地址 {ADDRESS}:8080
grpc连接地址 {ADDRESS}:8081
accessKey: ak8w4nbqnwe88d649c50c1c
secretKey: skd685a32c7665c4cc
```

测试链接：
```
$ grpcurl -plaintext {ADDRESS}:18081 list
apache.rocketmq.v2.MessagingService
grpc.channelz.v1.Channelz
grpc.reflection.v1alpha.ServerReflection
```