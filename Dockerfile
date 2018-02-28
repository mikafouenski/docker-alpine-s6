FROM alpine:3.7
MAINTAINER mikafouenski

RUN apk --no-cache add shadow && \
    wget https://github.com/just-containers/s6-overlay/releases/download/v1.21.2.2/s6-overlay-amd64.tar.gz -O /tmp/s6-overlay.tar.gz && \
    tar xfz /tmp/s6-overlay.tar.gz -C / && \
    useradd -u 2000 -U -d /config -s /bin/false -G users appuser && \
    mkdir /config && \
    rm /tmp/*

ADD root /

ENTRYPOINT ["/init"]
