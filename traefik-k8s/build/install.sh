#!/bin/bash

kubectl create ns traefik

# 创建traefik toml配置文件的configmap, 用于挂载
kubectl -n traefik create configmap traefik-config --from-file=templates/traefik.toml

# 安装traefik crd, 创建rbac权限
kubectl apply -f templates/crd.yaml -f templates/crd-rbac.yaml

# 开启traefik服务
kubectl apply -f templates/deployment.yaml
kubectl apply -f templates/service.yaml
