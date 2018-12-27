FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

# INSTALLATION DES PREREQUIS
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
libasound2 \
libasound2-plugins \
pulseaudio \
pulseaudio-utils \
libcanberra-gtk-module

# SELECTION DE LA LANGUE FRANCAISE
ENV LANG fr_FR.UTF-8
RUN echo fr_FR.UTF-8 UTF-8 > /etc/locale.gen && locale-gen

# AJOUT DE L'UTILISATEUR
RUN useradd -d /home/discord -m discord && \
passwd -d discord && \
adduser discord sudo

# SELECTION DE L'UTILISATEUR
USER discord

# SELECTION DE L'ESPACE DE TRAVAIL
WORKDIR /home/discord/

# INSTALLATION DE L'APPLICATION
RUN wget https://discordapp.com/api/download?platform=linux -O discord.deb && \
sudo dpkg -i discord.deb && \
sudo apt-get install -f -y && \
rm -rf discord.deb

# NETTOYAGE
RUN sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD discord -f
