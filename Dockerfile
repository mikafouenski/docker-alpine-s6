FROM alpine:3.7
MAINTAINER mikafouenski

ARG S6_V="v1.21.2.2"

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_V}/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz

RUN tar xfz /tmp/s6-overlay.tar.gz -C / && \
  echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
  apk --no-cache add shadow && \
  useradd -u 2000 -U -d /config -s /bin/false -G users appuser && \
  mkdir /config

ADD root /

ENTRYPOINT ["/init"]
