# https://github.com/bookercodes/dotfiles/blob/ubuntu/.zshrc
export ZSH=/home/aim/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(git nvm colorize ssh-agent tmux history jump extract gitignore)

source $ZSH/oh-my-zsh.sh
#export PATH="/home/aim/bin:/home/aim/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

export LANG=en_US.UTF-8

# https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias shutdown="sudo shutdown now"
alias restart="sudo restart now"

alias i3conf="vim ~/.config/i3/config"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

alias ls='ls -F1 --color=auto'
alias ll='ls -laFh'
alias zip='zip -9'
alias gzip='gzip -9'
alias bzip2='bzip2 -9'

alias cxx11="g++ --std=c++11 -pthread -Wall -Wextra -O2"
alias cxx="g++ -Wall -Wextra -O2"
alias c11="gcc --std=c11 -Wall -Wextra -O2"

# fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n1)
                                                                      
