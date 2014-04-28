#!/usr/bin/env bash

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
  curl -LSso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle

git clone git://github.com/tpope/vim-sensible.git
git clone git://github.com/jiangmiao/auto-pairs.git
git clone https://github.com/walm/jshint.vim.git
git clone git://github.com/tpope/vim-commentary.git
git clone https://github.com/pangloss/vim-javascript.git
git clone git://github.com/tpope/vim-abolish.git
git clone git://github.com/tpope/vim-repeat.git
git clone git://github.com/tpope/vim-sensible.git
git clone git://github.com/tpope/vim-surround.git
git clone git://github.com/tpope/vim-unimpaired.git