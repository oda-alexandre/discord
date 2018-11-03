FROM debian:latest

MAINTAINER https://oda-alexandre.github.io

RUN apt-get update

RUN apt-get install -y --no-install-recommends sudo tor privoxy libc++1 wget apt-utils ca-certificates libasound2 libatomic1 libgconf-2-4 libnotify4 libnspr4 libnss3 libxss1 libxtst6 libappindicator1 alsa-utils libasound2 libasound2-plugins pulseaudio pulseaudio-utils libcanberra-gtk-module

RUN useradd -d /home/discord -m discord
RUN passwd -d discord
RUN adduser discord sudo

USER discord

WORKDIR /home/discord/

RUN sudo rm -f /etc/privoxy/config
RUN sudo rm -f /etc/tor/torcc
RUN echo "listen-address localhost:8118" | sudo tee -a /etc/privoxy/config
RUN echo "forward-socks5 / localhost:9050 ." | sudo tee -a /etc/privoxy/config
RUN echo "forward-socks4 / localhost:9050 ." | sudo tee -a /etc/privoxy/config
RUN echo "forward-socks4a / localhost:9050 ." | sudo tee -a /etc/privoxy/config
RUN echo "SOCKSPort localhost:9050" | sudo tee -a /etc/tor/torcc

RUN wget https://discordapp.com/api/download?platform=linux -O discord.deb
RUN sudo dpkg -i discord.deb
RUN sudo apt-get install -f -y
RUN rm -rf discord.deb

RUN sudo apt-get --purge autoremove -y wget

CMD sudo service tor start && sudo service privoxy start && discord
