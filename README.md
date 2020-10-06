# DISCORD

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904441/discord.png)

- [DISCORD](#discord)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [BUILD](#build)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/discord/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/discord/commits/master)

## INTRODUCTION

Docker image of :

- [Discord](https://discordapp.com/)

Continuous integration on :

- [gitlab pipelines](https://gitlab.com/oda-alexandre/discord/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/discord/).

## PREREQUISITES

Use [docker](https://www.docker.com)

## BUILD

### DOCKER RUN

```\
docker run -d \
--name discord \
--group-add audio \
--cap-add=SYS_ADMIN \
--device /dev/snd \
-e DISPLAY \
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
-v ${HOME}:/home/discord \
-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
-v /dev/shm:/dev/shm \
-v /var/run/dbus:/var/run/dbus \
-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
-v /etc/localtime:/etc/localtime:ro \
alexandreoda/discord
```

### DOCKER COMPOSE

```yml
version: "2.0"

services:
  discord:
    container_name: discord
    image: alexandreoda/discord
    restart: "no"
    privileged: false
    cap_add:
      - SYS_ADMIN
    devices:
      - /dev/snd
    environment:
      - DISPLAY
      - PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native
    volumes:
      - "${HOME}:/home/discord"
      - "/tmp/.X11-unix/:/tmp/.X11-unix/"
      - "/dev/shm:/dev/shm"
      - "/var/run/dbus:/var/run/dbus"
      - "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native"
      - "/etc/localtime:/etc/localtime:ro"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/discord/blob/master/LICENSE)
