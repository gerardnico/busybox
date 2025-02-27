FROM alpine:3.20.3

####################################
# Label
# https://docs.docker.com/reference/dockerfile/#label
# This labels are used by Github
####################################
# * connect the repo
LABEL org.opencontainers.image.source="https://github.com/gerardnico/busybox"
# * set a description
LABEL org.opencontainers.image.description="Minimal Alpine Based BusyBox with many utilities such as curl"

# The --no-cache option allows to not cache the index locally, which is useful for keeping containers small.
# Literally it equals apk update in the beginning and rm -rf /var/cache/apk/*
RUN apk update \
     # Curl
     && apk add --no-cache curl \
     # Bash
     && apk add --no-cache bash \
     # NsLookup and dig
     && apk add --no-cache bind-tools \
     # Mtr
     && apk add --no-cache mtr \
     # Traceroute
     && apk add --no-cache traceroute \
     # Kubectl
     && apk add --no-cache kubectl \
     # Kubectl
     && apk add --no-cache openssl
     # Don't do `rm -rf` to keep the container small otherwise we can't install anything anymore \
     # We get: ERROR: unable to select packages
     # rm -rf /var/cache/apk/*

# The default shell
# Was sh for busybox: https://github.com/docker-library/busybox/blob/a2783b883c18c45a4d91a24327d42048a04068ff/latest/glibc/Dockerfile
CMD ["bash"]