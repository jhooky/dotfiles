# ~/.bashrc: executed by bash(1) for non-login shells.

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# set bash to use vi commands
set -o vi

# change umask to make directory sharing easir
umask 0002

# append to the history fie, don't overwrite 
shopt -s histappend 
