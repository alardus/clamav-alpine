FROM alpine:3
LABEL maintainer="Travis Quinnelly" 
LABEL maintainer_url="https://github.com/tquizzle/"

RUN apk update && \
apk add --no-cache pv ca-certificates clamav clamav-libunrar tzdata && \
apk add --upgrade apk-tools libcurl openssl busybox && \
rm -rf /var/cache/apk/*
sed -i 's|DatabaseMirror database.clamav.net|DatabaseMirror https://packages.microsoft.com/clamav|g' /etc/clamav/freshclam.conf

ENV SCANDIR=/scan
COPY scan.sh /scan.sh
ENTRYPOINT [ "sh", "/scan.sh" ]
