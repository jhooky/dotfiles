#!/usr/bin/env bash
# barrowed from technomancy

set -e

echo "Symlinking dotfiles..."

if [ -r $HOME/.bashrc ] && [ ! -h $HOME/.bashrc ] ; then
  rm $HOME/.bashrc # blow away the stock one
fi

if [ -r $HOME/.profile ] && [ ! -h $HOME/.profile ] ; then
  rm $HOME/.profile # blow away the stock one
fi

for f in $(ls -a ~/.dotfiles) ; do
  if [ ! -r "$HOME/$f" ] && [ $f != "." ] && [ $f != ".." ] &&
	   [ $f != "README.md" ] && [ "$f" != ".git" ] &&
     [ $f != ".gitignore" ] && [ $f != "LICENSE-MIT.txt" ]; then

     ln -s "$HOME/.dotfiles/$f" "$HOME/$f"
  fi
done
