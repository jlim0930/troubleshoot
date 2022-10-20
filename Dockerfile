ARG version=latest

FROM alpine:${version}

MAINTAINER Justin Lim (justin@isthecoolest.ninja)



RUN set -ex \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    apache2-utils \
    arp-scan \
    bash \
    bash-completion \
    bind-tools \
    bridge-utils \
    busybox-extras \
    ca-certificates \
    conntrack-tools \
    curl \
    dhcping \
    drill \
    ethtool \
    file\
    fping \
    hping3 \
    iftop \
    iotop \
    iperf \
    iperf3 \
    iproute2 \
    ipset \
    iptables \
    iptraf-ng \
    iputils \
    ipvsadm \
    jq \
    lftp \
    libc6-compat \
    liboping \
    lsof \
    mtr \
    net-snmp-tools \
    netcat-openbsd \
    net-tools \
    nftables \
    ngrep \
    nmap \
    nmap-nping \
    nmap-scripts \
    openssl \
    openssh \
    py3-pip \
    py3-setuptools \
    rsync \
    scapy \
    socat \
    speedtest-cli \
    strace \
    sysstat \
    tcpdump \
    tcptraceroute \
    tshark \
    util-linux \
    vim \
    git \
    websocat \
    wget \
    perl-crypt-ssleay \
    perl-net-ssleay


USER root
WORKDIR /root
ENV HOSTNAME troubleshoot

RUN chmod -R g=u /root
RUN chown root:root /usr/bin/dumpcap

CMD ["bash"]
