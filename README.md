# TROUBLESHOOT

Container to help troubleshoot issues for docker &amp; kubernetes environments

This container image was created to help troubleshoot various network/storage/OS issues inside of docker &amp; kubernetes environments.  Containers are created to be slim, with slim containers it usually do not have any type of troubleshooting tools installed or even have the ablity to install it.  Simple tasks such as name resolution, pings, etc to complex tasks can be hard to run since the basic OS tools are missing.  This container image was created to fill that gap.

## Docker

- For issues within the applications container, you can run `troubleshoot` in the container's network

```
$ docker run --name troubleshoot -it --net container:<container name> jlim0930/troubleshoot
```

- For issues where you need to have the host's network

```
$ docker run --name troubleshoot -it --net host jlim0930/troubleshoot
```

## Kubernetes

- To spin up a throw away pod for troubleshooting

```
$ kubectl -n <namespace> run troubleshoot --rm -i --tty --image jlim0930/troubleshoot
```

- If you need to access the k8s's nodes host network

```
$ kubeclt -n <namespace> run troubleshoot --rm -i --tty --overrides='{"spec":"hostNetowrk": true}}' --image jlim0930/troubleshoot
```

- If you want to run this as a sidecar container along with your application

```
template:
  spec:
    containers:
    - name: troubleshoot
        image: jlim0930/troubleshoot
        command: ["/bin/bash"]
        args: ["-c", "while true; do sleep 60; done"]
```

```
$ kubectl -n <namespace> -it <name of pod> -c troubleshoot -- bash
```

## Tools included

```
apache2-utils
arp-scan
bash
bash-completion
bind-tools
bridge-utils
busybox-extras
ca-certificates
conntrack-tools
curl
dhcping
drill
ethtool
file\
fping
hping3
iftop
iotop
iperf
iperf3
iproute2
ipset
iptables
iptraf-ng
iputils
ipvsadm
jq
lftp
libc6-compat
liboping
lsof
mtr
net-snmp-tools
netcat-openbsd
net-tools
nftables
ngrep
nmap
nmap-nping
nmap-scripts
openssl
openssh
py3-pip
py3-setuptools
rsync
scapy
socat
speedtest-cli
strace
sysstat
tcpdump
tcptraceroute
tshark
util-linux
vim
git
websocat
wget
perl-crypt-ssleay
perl-net-ssleay
```