FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER discord
ENV HOME /home/${USER}
ENV LOCALES fr_FR.UTF-8
ENV VERSION 0.0.9

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apt-get update && apt-get install -y --no-install-recommends \
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
  libcanberra-gtk-module

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m'; \
  locale-gen ${LOCALES}

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m'; \
  useradd -d ${HOME} -m ${USER}; \
  passwd -d ${USER}; \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m'; \
  wget https://dl.discordapp.net/apps/linux/${VERSION}/discord-${VERSION}.deb -O discord.deb; \
  sudo dpkg -i discord.deb; \
  sudo apt-get install -f -y; \
  rm -rf discord.deb

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m'; \
  sudo apt-get --purge autoremove -y \
  wget; \
  sudo apt-get autoclean -y; \
  sudo rm /etc/apt/sources.list; \
  sudo rm -rf /var/cache/apt/archives/*; \
  sudo rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD discord \