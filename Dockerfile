FROM artixlinux/artixlinux:base-dinit

RUN \
  pacman -Syu --noconfirm && \
  pacman -S artools-pkg artix-checkupdates artix-metro vim pacman-contrib sudo --noconfirm && \
  useradd -mG users,wheel ndowens && \
  passwd -d ndowens && \
  ln -sf /usr/bin/artix-checkupdates /usr/bin/cupdates
COPY /sudoers /etc
