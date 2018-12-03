FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

RUN apt-get update && apt-get install -y --no-install-recommends \
sudo \
tor \
privoxy \
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

RUN useradd -d /home/discord -m discord && \
passwd -d discord && \
adduser discord sudo

USER discord

WORKDIR /home/discord/

RUN sudo rm -f /etc/privoxy/config && \
sudo rm -f /etc/tor/torcc && \
echo "listen-address localhost:8118" | sudo tee -a /etc/privoxy/config && \
echo "forward-socks5 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4a / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "SOCKSPort localhost:9050" | sudo tee -a /etc/tor/torcc

RUN wget https://discordapp.com/api/download?platform=linux -O discord.deb && \
sudo dpkg -i discord.deb && \
sudo apt-get install -f -y && \
rm -rf discord.deb

RUN sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*


CMD sudo service tor start && sudo service privoxy start && discord
