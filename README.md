# Alibaba Sentinel DashBoard

## 1. 简介

Alibaba Sentinel DashBoard <https://sentinelguard.io/zh-cn/docs/dashboard.html>

## 2. 编译并上传镜像

```sh
docker buildx build --platform linux/arm64,linux/amd64 --build-arg VERSION=1.8.2 -t nnzbz/alibaba-sentinel-dashboard:1.8.2 . --push
# latest
docker buildx build --platform linux/arm64,linux/amd64 --build-arg VERSION=1.8.2 -t nnzbz/alibaba-sentinel-dashboard:latest . --push
```

## 3. 单机运行

```sh
docker run -dp38080:8080 --name 容器名称 --restart=always nnzbz/alibaba-sentinel-dashboard
```

## 4. SWARM

- 创建部署文件

```sh
mkdir /usr/local/alibaba-sentinel-dashboard
vi /usr/local/alibaba-sentinel-dashboard/stack.yml
```

```yaml{.line-numbers}
version: "3.9"

services:
  server:
    image: nnzbz/alibaba-sentinel-dashboard
    hostname: alibaba-sentinel-dashboard
    ports:
      # Http端口
      - "38080:8080"
    environment:
      # 登录用户名称
      - USER_NAME: sentinel
      # 登录用户密码 
      - USER_PSWD: sentinel

networks:
  default:
    external: true
    name: rebue
```

- 部署

```sh
docker stack deploy -c /usr/local/alibaba-sentinel-dashboard/stack.yml alibaba-sentinel-dashboard
```

## 5. 访问

- `http://<IP或主机地址>:38080/`
- 默认的账户和密码都是 `sentinel`
