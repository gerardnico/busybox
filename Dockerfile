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
     && apk add curl \
     # Bash
     && apk add bash \
     # NsLookup and dig
     && apk add bind-tools \
     # Kubectl
     && apk add kubectl \
     # Keep container small
     rm -rf /var/cache/apk/*

# The default shell
# Was sh for busybox: https://github.com/docker-library/busybox/blob/a2783b883c18c45a4d91a24327d42048a04068ff/latest/glibc/Dockerfile
CMD ["bash"]