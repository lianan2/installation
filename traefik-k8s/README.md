# traefik

安装：
```
sh build/install.sh
sh build/install-middleware.sh
```

卸载：
```
sh build/uninstall.sh
```


访问 traefik Dashboard: http://localhost:32080/dashboard/#/

测试网关请求:
```
curl http://localhost:30080/ -v
```
