FROM alpine:3.18
LABEL maintainer="Travis Quinnelly" maintainer_url="https://github.com/tquizzle/"

RUN apk update && \
apk add --no-cache pv ca-certificates clamav clamav-libunrar && \
apk add --upgrade apk-tools libcurl openssl busybox && \
rm -rf /var/cache/apk/*

ENV SCANDIR=/scan
COPY scan.sh /scan.sh
ENTRYPOINT [ "sh", "/scan.sh" ]