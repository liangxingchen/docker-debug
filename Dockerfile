FROM debian:12.0-slim

COPY sources.list /etc/apt/sources.list

RUN apt update \
  && apt install -y --no-install-recommends ca-certificates curl busybox net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && for cmd in `busybox --list | grep -v '\['`; do if [ -z `which $cmd` ];then ln -s /bin/busybox /bin/$cmd; fi ; done 

ENTRYPOINT ["sleep","infinity"]
