FROM alpine:3.21
RUN apk add --no-cache curl unzip ca-certificates
ARG XRAY_VERSION=v26.11.9
RUN curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/${XRAY_VERSION}/Xray-linux-64.zip \
 && unzip -o /tmp/xray.zip -d /usr/local/bin/ xray \
 && chmod +x /usr/local/bin/xray \
 && rm -f /tmp/xray.zip
# 注意：配置文件不在镜像里，Render 的 Secret Files 会在运行时
# 把 config.json 写到 /etc/xray/config.json
CMD ["/usr/local/bin/xray", "run", "-c", "/etc/xray/config.json"]
