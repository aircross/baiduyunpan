#!/bin/sh
case $1 in
    amd64)
        ARCH="amd64"
        FNAME="amd64"
        ;;
    i386)
        ARCH="386"
        FNAME="i386"
        ;;
    armv8 | arm64 | aarch64)
        ARCH="arm64"
        FNAME="arm64"
        ;;
    armv7 | arm | arm32)
        ARCH="armv7"
        FNAME="arm32"
        ;;
    armv5)
        ARCH="armv5"
        FNAME="armv6"
        ;;
    *)
        ARCH="64"
        FNAME="amd64"
        ;;
esac
mkdir -p /BaiduPCS
# https://github.com/masx200/baidupcs-web/releases/download/3.7.3/BaiduPCS-Go-v3.7.3-linux-amd64.zip
wget "https://github.com/masx200/baidupcs-web/releases/download/3.7.3/BaiduPCS-Go-v3.7.3-linux-${ARCH}.zip"
unzip "BaiduPCS-Go-3.7.3-linux--${ARCH}.zip"
mv "/BaiduPCS-Go-3.7.3-linux-${ARCH}/BaiduPCS-Go" /BaiduPCS
rm -rf "BaiduPCS-Go-3.7.3-linux-${ARCH}" "BaiduPCS-Go-3.7.3-linux-${ARCH}.zip"
chmod a+x /BaiduPCS/BaiduPCS-Go