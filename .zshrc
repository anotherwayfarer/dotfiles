# DEFAULT CONFIGURATION
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# MY CUSTOMIZATION

# export ZSH=/home/aim/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(git nvm ssh-agent history jump extract gitignore)
# plugins=(git nvm colorize ssh-agent tmux history jump extract gitignore)

DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

# source $ZSH/oh-my-zsh.sh
# export PATH="/home/aim/bin:/home/aim/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

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
alias vimcpprc="vim ~/.vim/after/ftplugin/cpp.vim"
alias tmuxconf="vim ~/.tmux.conf"

alias ls='ls -F1 --color=auto'
alias ll='ls -laFh'
alias zip='zip -9'
alias gzip='gzip -9'
alias bzip2='bzip2 -9'

alias cl++14="g++ --std=c++14 -pthread -Wall -Wextra -O2"
alias g++14="g++ --std=c++14 -pthread -Wall -Wextra -O2"
alias g++03="g++ -Wall -Wextra -O2"
alias c11="gcc --std=c11 -Wall -Wextra -O2"
alias make='make -j$(nproc)'

alias begincoding="cd ~/Dev/\!Projects/Maze && vim src/main.cpp"

# disable ^s ^f commands
stty -ixon
# fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n1)
# curl wttr.in/Kirov


# launch tmux
# if [ "$TMUX" = "" ]; then tmux; fi

