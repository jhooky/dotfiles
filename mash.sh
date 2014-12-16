#!/usr/bin/env bash
# barrowed from technomancy

set -e

SRC_DIR="$(pwd)/src"

echo "Symlinking dotfiles..."

if [ -r $HOME/.bashrc ] && [ ! -h $HOME/.bashrc ] ; then
  rm $HOME/.bashrc # blow away the stock one
fi

if [ -r $HOME/.profile ] && [ ! -h $HOME/.profile ] ; then
  rm $HOME/.profile # blow away the stock one
fi

for f in $(ls -a $SRC_DIR) ; do
  if [ ! -r "$HOME/$f" ] && [ $f != "." ] && [ $f != ".." ] ; then

    ln -s "$SRC_DIR/$f" "$HOME/.$f"

    echo ".$f linked"
    
  fi
done
