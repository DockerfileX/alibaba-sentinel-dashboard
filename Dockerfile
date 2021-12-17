# 基础镜像
FROM --platform=${TARGETPLATFORM} nnzbz/spring-boot-app

ARG VERSION

# 作者及邮箱
# 镜像的作者和邮箱
LABEL maintainer="nnzbz@163.com"
# 镜像的版本
LABEL version=${VERSION}
# 镜像的描述
LABEL description="Alibaba Sentinel DashBoard"

COPY ./sentinel-dashboard-${VERSION}.jar /usr/local/myservice/myservice.jar

# 系统属性
ENV PORT=8080
ENV SYS_PROP="-Dserver.port=${PORT} -Dcsp.sentinel.dashboard.server=localhost:${PORT} -Dproject.name=sentinel-dashboard"
