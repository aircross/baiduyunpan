#本镜像基于最新版alpine+glibc+BaiduPCSweb
FROM alpine:edge
ARG TARGETARCH

LABEL MAINTAINER="John"

#百度云盘Docker版，适用系统：CentOS 7、Unbutu、Debian、Fedora、Raspberry Pi等linux系统，
#也适用于windos、mac等系统
ENV GLIBC_VERSION=2.35-r1
# https://github.com/masx200/baidupcs-web/releases/tag/3.7.3
# ENV SOURCE=https://github.com/masx200/baidupcs-web/releases/download/3.7.3/BaiduPCS-Go-3.7.3-linux-amd64.zip

RUN apk update \
	&& apk --no-cache add ca-certificates wget libstdc++ tzdata \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Shanghai' >  /etc/timezone \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-2.35-r1.apk \
    && apk --no-cache add glibc-2.35-r1.apk

RUN ./DockerInit.sh "$TARGETARCH"

RUN apk del wget tzdata \
	&& rm -rf /glibc-${GLIBC_VERSION}.apk 
WORKDIR /root/Downloads
VOLUME ["/root/Downloads"]
EXPOSE 5299 

CMD ["sh", "-c", "/BaiduPCS/BaiduPCS-Go"]
