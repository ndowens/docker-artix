FROM artixlinux/artixlinux:base-dinit

RUN \
  pacman -Syu --noconfirm && \
  pacman -S artools-pkg artix-checkupdates artix-metro && \
  useradd -mG users,wheel ndowens && \
  passwd -d ndowens
