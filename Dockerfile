FROM ghcr.io/linuxserver/baseimage-selkies:arch
ENV TITLE=Betterbird
RUN \
  curl -o \
  /usr/share/selkies/www/icon.png \
  https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/thunderbird-logo.png && \
  pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && \
  pacman-key --lsign-key 3056513887B78AEB && \
  pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' && \
  pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && \
  echo '[chaotic-aur]' >> /etc/pacman.conf && \
  echo 'Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf && \
  pacman -Syu --noconfirm && \
  pacman -S betterbird
COPY /root /
EXPOSE 3008
VOLUME /config
