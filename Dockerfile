# IMAGE TO USE
FROM debian:stretch-slim

# MAINTAINER
MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER discord
ENV LANG fr_FR.UTF-8
ENV VERSION 0.0.9

# INSTALL PACKAGES
RUN apt-get update && apt-get install -y --no-install-recommends \
sudo \
locales \
wget \
apt-utils \
ca-certificates \
libc++1 \
libasound2 \
libatomic1 \
libgconf-2-4 \
libnotify4 \
libnspr4 \
libnss3 \
libxss1 \
libxtst6 \
libappindicator1 \
alsa-utils \
libasound2-plugins \
pulseaudio \
pulseaudio-utils \
libgtk-3-0 \
libcanberra-gtk-module && \

# CHANGE LOCALES
echo ${LANG} > /etc/locale.gen && locale-gen && \

# ADD USER
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# SELECT WORKING SPACE
WORKDIR /home/${USER}

# INSTALL APP
RUN wget https://dl.discordapp.net/apps/linux/${VERSION}/discord-${VERSION}.deb -O discord.deb && \
sudo dpkg -i discord.deb && \
sudo apt-get install -f -y && \
rm -rf discord.deb && \

# CLEANING
sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# START THE CONTAINER
CMD discord \
