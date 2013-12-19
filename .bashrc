# ~/.bashrc: executed by bash(1) for non-login shells.

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set bash to use vi commands
set -o vi

# change umask to make directory sharing easir
umask 0002

# append to the history fie, don't overwrite 
shopt -s histappend 

# ignore duplicates and cmds with leading
export HISTCONTROL=ignoredboth
export HISTSIZE=1000
export HISTFILESIZE=2000

# Add some helpful aliases
alias ls='ls --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -Alh'
alias grep='grep --color=auto'
alias vi='vim'
