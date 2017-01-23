FROM debian:jessie

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV uid 1000
ENV gid 1000

RUN apt-get update && apt-get install -y \
    vlc \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -m vlc \
 && usermod -a -G audio vlc

COPY start-vlc.sh /tmp/

ENTRYPOINT ["/tmp/start-vlc.sh"]
