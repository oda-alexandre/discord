# DISCORD

![atom](https://raw.githubusercontent.com/oda-alexandre/discord/master/logo-discord.png) ![docker](https://raw.githubusercontent.com/oda-alexandre/discord/master/logo-docker.png)


## INDEX

- [Build Docker](#BUILD)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BUILD DOCKER

[![atom docker build](https://img.shields.io/docker/build/alexandreoda/discord.svg)](https://hub.docker.com/r/alexandreoda/discord)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de [Discord](https://discordapp.com/) pour [Docker](https://www.docker.com), mis à jour automatiquement dans le [Docker Hub](https://hub.docker.com/r/alexandreoda/discord/) public.


## PREREQUIS

Installer [Docker](https://www.docker.com)


## INSTALLATION

```
mkdir $HOME/discord
```
```
docker run -d --name discord -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -v ${HOME}/discord:/home/discord/discord -e DISPLAY alexandreoda/discord
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/discord/blob/master/LICENSE)
