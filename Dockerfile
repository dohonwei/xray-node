FROM alpine:3.21
RUN apk add --no-cache curl unzip ca-certificates
ARG XRAY_VERSION=v26.11.9
RUN curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/${XRAY_VERSION}/Xray-linux-64.zip \
 && unzip -o /tmp/xray.zip -d /usr/local/bin/ xray \
 && chmod +x /usr/local/bin/xray \
 && rm -f /tmp/xray.zip
# 配置不进镜像：启动时由环境变量 XRAY_CONFIG 写入
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
