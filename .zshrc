###############################################################################
# Exports
###############################################################################
export SYNC_ENGINE_FOLDER=$HOME/Dropbox
export DOTFILES=$SYNC_ENGINE_FOLDER/Mackup
export EDITOR='vim'
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$PATH:/usr/local/sbin:/usr/local/bin"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$PATH:/Users/Marco/bin"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
 
###############################################################################
# zsh
###############################################################################
ZSH=$DOTFILES/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git vi-mode zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# TODO: If we are on a big repo, override git prompt.
# For now it always overrides.
function git_prompt_info() {
    if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
        ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
        echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}
function git_prompt_status() {
    echo ''
}

###############################################################################
# Theme and colors
###############################################################################
# Main theme.
export THEME="base16-ocean"
if [ -z "$BACKGROUND" ]; then
    export BACKGROUND="dark"
fi
BASE16_SHELL="$DOTFILES/.config/base16-shell/$THEME.$BACKGROUND.sh"
source $BASE16_SHELL

# Dark and light background.
function light() {
    export BACKGROUND="light" && reload!
}
function dark() {
    export BACKGROUND="dark" && reload!
}

###############################################################################
# Miscellaneous
###############################################################################
# Use ctrl-z to toggle between background and foreground.
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

# Use 
function clip { [ -t 0  ] && pbpaste || pbcopy  }

# vi-mode
bindkey -v
export KEYTIMEOUT=1

###############################################################################
# Aliases
###############################################################################
alias reload!='source ~/.zshrc'
alias c='clear'
alias cleandd='rm -rf ~/Library/Developer/Xcode/DerivedData ; rm -rf ~/Library/Caches/appCode31/DerivedData'
alias mvim='open -a MacVim' # Avoid to open files in a new window
alias t='open -a TextEdit'
alias open-xcode="open -a \"Xcode\""
alias open-xcode-beta="open -a \"Xcode-Beta\""
alias deckset="open -a \"Deckset\""
alias pbclean='pbpaste | pbcopy'

# Quick language specific templates
TEMPLATES="/Users/marco/Dropbox/Dev/templates"
alias template-cpp="cp $TEMPLATES/cpp.template ./template.cpp"
alias template-c="cp $TEMPLATES/c.template ./template.c"
alias template-objc="cp $TEMPLATES/objc.template ./template.m"
alias template-swift-playground="cp -R $TEMPLATES/swift-playground.template ./template.playground"
alias template-swift-file="cp $TEMPLATES/swift.template ./template.swift"

# git additions to zsh
alias gds="git diff --staged"

# tig
alias t='tig'
alias tis='tig status'
alias til='tig log'
alias tib='tig blame -C'

# tmux
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'

# Google translate
alias tr='trans'

###############################################################################
# Google
###############################################################################
source ~/Google\ Drive/sync/google.zsh


