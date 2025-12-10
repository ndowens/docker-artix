#!/bin/bash
if [ ! -d /home/ndowens/.oh-my-zsh ]; then
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   sed -e '/ZSH_THEME/ s,robbyrussel,norm,' /home/ndowens/.zshrc \
       -e ''/plugins=/s,git,git ssh-agent,' \
       -i /home/ndowens/.zshrc
fi
