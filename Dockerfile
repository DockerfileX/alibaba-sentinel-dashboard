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

# 服务器端口号
ENV PORT=8080
# 登录用户名称
ENV USER_NAME=sentinel
# 登录用户密码
ENV USER_PSWD=sentinel
# 系统属性
RUN sed -i '1i\SYS_PROP="-Dserver.port=${PORT} -Dcsp.sentinel.dashboard.server=localhost:${PORT} -Dsentinel.dashboard.auth.username=${USER_NAME} -Dsentinel.dashboard.auth.password=${USER_PSWD} -Dproject.name=sentinel-dashboard"' entrypoint.sh