# **<center>discord</center>**


**INTRODUCTION**

*discord https://discordapp.com/ via docker*

**PREREQUIS**

*Installer docker*


**INSTALLATION**

copier/coller dans un terminal :

    mkdir $HOME/discord

    docker run -d --name discord -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -v ${HOME}/discord:/home/discord/discord -e DISPLAY alexandreoda/discord


**LICENSE**

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/discord/blob/master/LICENSE)
