# ~/.bashrc: executed by bash(1) for non-login shells.
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# set bash to use vi commands
set -o vi

# set prompt
# export PS1="\[\033[0;32m\][\u@\h \W]\$\[\033[0m\] "

# change umask to make directory sharing easir
umask 0002

# append to the history fie, don't overwrite 
shopt -s histappend 
