FROM artixlinux/artixlinux:base-dinit

RUN \
  pacman -Syu --noconfirm && \
  pacman -S artools-pkg artix-checkupdates artix-metro vim pacman-contrib sudo --noconfirm && \
  useradd -mG users,wheel ndowens && \
  passwd -d ndowens && \
  ln -sf /usr/bin/artix-checkupdates /usr/bin/cupdates
COPY /sudoers /etc
VOLUME HOME:/home/ndowens
COPY /config /home/ndowens/.config/git
COPY /autostart /etc/default/
RUN chown -R ndowens:ndowens /home/ndowens
USER ndowens
RUN \
  mkdir -p /home/ndowens/.cache/artix-checkupdates
RUN \
  echo 'eval `ssh-agent -s`' >> /home/ndowens/.bashrc
