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


访问 traefik Dashboard: http://vm.apps.com:18080/

测试请求whoami服务:
```
curl http://vm.apps.com/test -v
curl http://vm.apps.com/login --header 'Authorization: Bearer xxx'
```
