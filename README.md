# ETCHER

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/20894670/etcher.jpg)

- [ETCHER](#etcher)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [BUILD](#build)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/etcher/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/etcher/commits/master)

## INTRODUCTION

Docker image of :

- [etcher](https://www.balena.io/etcher)

Continuous integration on :

- [gitlab pipelines](https://gitlab.com/oda-alexandre/etcher/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/etcher)

## PREREQUISITES

- Use [docker](https://www.docker.com)

## BUILD

### DOCKER RUN

```\
docker run -d \
--name etcher \
-e DISPLAY \
-v ${HOME}:/home/etcher \
-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
-v /dev/bus/usb:/dev/bus/usb \
alexandreoda/etcher
```

### DOCKER COMPOSE

```yml
version: "2.0"

services:
  etcher:
    container_name: etcher
    image: alexandreoda/etcher
    restart: no
    network_mode: none
    privileged: false
    environment:
      - DISPLAY
    volumes:
      - "${HOME}:/home/etcher"
      - "/tmp/.X11-unix/:/tmp/.X11-unix/"
      - "/dev/bus/usb:/dev/bus/usb"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/etcher/blob/master/LICENSE)
