# Minimal Alpine Based BusyBox with many utilities such as curl

## About

A [Busybox](https://busybox.net/) container image implemented with alpine instead 
so that:
* it contains basic/core cli tools for executing Bash scripts
* any tool can be added trivially:

```bash
apk add my-tool
```

## Usage

We support only the [latest tag](https://github.com/gerardnico/busybox/pkgs/container/busybox)
```bash
docker pull ghcr.io/gerardnico/busybox:latest
```

## Why

[Busybox](https://busybox.net/) is a lightweight GNU environment 
for embedded system. 

This container is used a lot to start a small container
in a Kubernetes environment to troubleshoot or as ephemeral container.

But Busybox miss a lof of utilities such as `curl` because BusyBox implements
a subsets of the clients, it does not install them (as stated in this [issue](https://github.com/docker-library/busybox/issues/47))

Example : wget reimplementation : https://git.busybox.net/busybox/tree/networking/wget.c?h=1_32_stable

## List of embedded cli

* curl
* nslookup. dig (ie bind-tools)
* kubectl
