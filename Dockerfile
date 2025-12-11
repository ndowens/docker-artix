FROM artixlinux/artixlinux:base-dinit

RUN \
  pacman -Syu --noconfirm && \
  pacman -S artools-pkg artix-checkupdates artix-metro \
    vim pacman-contrib sudo less zsh \
    --noconfirm && \
  useradd -mG users,wheel ndowens && \
  passwd -d ndowens && \
  ln -sf /usr/bin/artix-checkupdates /usr/bin/cupdates && \
  ln -sf /usr/bin/artix-metro /usr/bin/am
COPY /sudoers /etc
VOLUME HOME:/home/ndowens
COPY /config /home/ndowens/.config/git
COPY /autostart /etc/default/
RUN chown -R ndowens:ndowens /home/ndowens
USER ndowens
RUN \
  mkdir -p /home/ndowens/.cache/artix-checkupdates
RUN if [ ! -d /home/ndowens/.oh-my-zsh ]; then \
     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" | echo y && \
     sed -e '/ZSH_THEME/ s,robbyrussel,norm,' -e '/plugins=/s,git,git ssh-agent,' -i /home/ndowens/.zshrc \
    fi
