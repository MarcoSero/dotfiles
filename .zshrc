# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
DEFAULT_USER="marco"

plugins=(git zsh-syntax-highlighting vi-mode)

source $ZSH/oh-my-zsh.sh

export JAVA_HOME="$(/usr/libexec/java_home)"
export HADOOP_INSTALL=/Users/marco/Dropbox/Dscover/code/hadoop-install/hadoop-1.1.2
export PATH=$PATH:$HADOOP_INSTALL/bin

# fix homebrew
export PATH="$PATH:/usr/local/sbin:/usr/local/bin"

# ~/bin
export PATH="$PATH:$HOME/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# subl command in home
export PATH="$PATH:/Users/Marco/bin"

# cabal 
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"

# use MacVim to edit commit messages
#export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a iTerm"'
#export GIT_EDITOR='mvim -f --nomru -c "au VimLeave * !open -a iTerm"'

# use ctrl-z to toggle between background and foreground
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

# Use vi-mode
bindkey -v
export KEYTIMEOUT=1

# Print TODOs
cat ~/todo.txt
