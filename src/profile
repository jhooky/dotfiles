#!/bin/bash

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias p="cd ~/projects"
alias f="open ."
alias h="history"
alias j="jobs"

# Git Shortcuts
alias g="git"
alias gs="git status"

# Mac ls colors ... need to research all this ls nonsense
#export CLICOLOR=1
#export LSCOLORS=cxfxcxdxbxegedabagacad
#export LS_COLORS='no=00:fi=00:di=31:ln=00;30:or=01;31'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# List Shortcuts
alias l="ls -F ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias la="ls -AF ${colorflag}"
alias al="ls -lAFh ${colorflag}"
alias lsd="ls -l ${colorflag} | grep --color=never '^d'"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

set bell-style visible

# emacs the default editor
export EDITOR="emacs"
#export EDITOR="emacsclient -c -a emacs"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Append to the history file, don't overwrite
shopt -s histappend

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# `e` with no arguments opens the current directory in $EDITOR,
# otherwise opens the given location
function e() {
  if [ $# -eq 0 ]; then
    $EDITOR .
  else
    $EDITOR "$@"
  fi
}

# search history for a single keyword
function hs() {
  history | grep $1
}

# add '~/.rbenv' if present and init
if [ -d "$HOME/.rbenv/bin" ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# add '~/local/bin' if present
if [ -d "$HOME/local/bin" ] ; then
  export PATH="$HOME/local/bin:$PATH"
fi

# add '~/.npm-packages/bin' if present
if [ -d "$HOME/.npm-packages/bin" ] ; then
  export PATH="$HOME/.npm-packages/bin:$PATH"
fi

# source '~/.nvm/nvm.sh' if present
#if [ -d "$HOME/.nvm" ] ; then
#  export NVM_DIR="$HOME/.nvm"
#  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#fi

# [0m  reset all attributes
# [1m  set 'bright' attr
# [2m  set 'dim' attr
# [4m  set 'underscore' attr
# [5m  set 'blick'attr
# [7m  set 'reverse' attr
# [8m  set 'hidden' attr

## Foreground
# [30m black
# [31m red
# [32m green
# [33m yellow
# [34m blue
# [35m magenta
# [36m cyan
# [37m white
# [39m set default

## Background
# [40m black
# [41m red
# [42m green
# [43m yellow
# [44m blue
# [45m magenta
# [46m cyan
# [47m white
# [49m set default

# set prompt
## backup
#export PS1="\n\[\e[0;35m\]\h \[\e[39m\]in \[\e[0;32m\]\w\n\[\e[0;36m\]$ \[\e[39m\]"
## like it but want it to try it simpler
#export PS1="\[\e[0;37m\]\h \[\e[32m\]in \[\e[0;37m\]\w\n\[\e[0;32m\]$ \[\e[39m\]"
export PS1="\[\e[0;32m\]$ \[\e[39m\]"
