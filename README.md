# DISCORD

<img src="https://fontmeme.com/images/discord-logo-font.png" />


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [PREREQUISITESites](#PREREQUISITESITES)
- [Install](#INSTALL)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/discord/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/discord/commits/master)


## INTRODUCTION

Docker image of :

- [Discord](https://discordapp.com/)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/discord/pipelines)

automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/discord/).


## PREREQUISITES

Use [docker](https://www.docker.com)


## INSTALL

```
docker run -d --name discord -v ${HOME}:/home/discord -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -e DISPLAY alexandreoda/discord
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/discord/blob/master/LICENSE)
