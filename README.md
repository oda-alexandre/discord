# DISCORD

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904441/discord.png)

## INDEX

- [DISCORD](#discord)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
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

## INSTALL

### DOCKER RUN

```\
docker  run -d --name discord -v ${HOME}:/home/discord -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add audio --device /dev/snd --cap-add=SYS_ADMIN -e DISPLAY alexandreoda/discord
```

### DOCKER COMPOSE

```yml
version: "3.7"

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
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/discord/blob/master/LICENSE)
