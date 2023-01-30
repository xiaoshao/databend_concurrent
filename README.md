#测试databend并发情况下的性能
---

1、 安装环境

2、 初始化用户
```roomsql
create user 'zwshao'@'%' identified by 'zwshao';
grant ALL on *.* to 'zwshao'@'%';
```

2、 初始化测试环境
```shell
    ./init_env.sh <host> <mysql_port> <http_port>
```



