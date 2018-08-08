FROM maichong/ubuntu:16.04

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  iptables \
  busybox \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && for cmd in `busybox --list | grep -v '\['`; do if [ -z `which $cmd` ];then ln -s /bin/busybox /bin/$cmd; fi ; done 

CMD ["sleep","infinity"]
