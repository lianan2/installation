#!/bin/bash

kubectl create ns apps
  
# 部署测试服务
kubectl apply -f templates/middleware/whoami-deploy.yaml
kubectl apply -f templates/middleware/whoami-svc.yaml

# 创建中间件
kubectl apply -f templates/middleware/auth.yaml
kubectl apply -f templates/middleware/cros.yaml
kubectl apply -f templates/middleware/login_interceptor.yaml
kubectl apply -f templates/middleware/rename_header.yaml

# 测试服务的路由规则
kubectl apply -f templates/middleware/whoami-ingressroute.yaml
