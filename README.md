# Alibaba Sentinel DashBoard

## 1. 简介

Alibaba Sentinel DashBoard <https://sentinelguard.io/zh-cn/docs/dashboard.html>

## 2. 编译并上传镜像

```sh
docker buildx build --platform linux/arm64,linux/amd64 -t nnzbz/alibaba-sentinel-dashboard:1.8.2 . --push
# latest
docker buildx build --platform linux/arm64,linux/amd64 -t nnzbz/alibaba-sentinel-dashboard:latest . --push
```

## 3. 创建并运行容器

```sh
docker run -dp8080:8080 --name 容器名称 --restart=always nnzbz/alibaba-sentinel-dashboard
```

## 4. SWARM

```sh

```