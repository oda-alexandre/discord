# DISCORD

[![dockeri.co](https://dockeri.co/image/alexandreoda/discord)](https://hub.docker.com/r/alexandreoda/discord)


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/discord.svg)](https://microbadger.com/images/alexandreoda/discord)
[![size](https://images.microbadger.com/badges/image/alexandreoda/discord.svg)](https://microbadger.com/images/alexandreoda/discord")
[![build](https://img.shields.io/docker/build/alexandreoda/discord.svg)](https://hub.docker.com/r/alexandreoda/discord)
[![automated](https://img.shields.io/docker/automated/alexandreoda/discord.svg)](https://hub.docker.com/r/alexandreoda/discord)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de

- [Discord](https://discordapp.com/)

Mis à jour automatiquement dans le [docker hub public](https://hub.docker.com/r/alexandreoda/discord/).


## PREREQUIS

Installer [docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name discord -v ${HOME}:/home/discord -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -e DISPLAY alexandreoda/discord
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/discord/blob/master/LICENSE)
