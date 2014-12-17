#!/usr/bin/env bash
# mash.sh by lookyhooky

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

SRC_DIR="$(pwd)/src"    # source directory
DST_DIR="$HOME"         # destination directory

source "$DIR/bin/easy.sh"

cat << "EOF"
Welcome to lookyhooky/dotfiles... may they mash well with yours

  _____ ______   ________  ________  ___  ___
 |\   _ \  _   \|\   __  \|\   ____\|\  \|\  \
 \ \  \\\__\ \  \ \  \|\  \ \  \___|\ \  \\\  \
  \ \  \\|__| \  \ \   __  \ \_____  \ \   __  \
   \ \  \    \ \  \ \  \ \  \|____|\  \ \  \ \  \
    \ \__\    \ \__\ \__\ \__\____\_\  \ \__\ \__\
     \|__|     \|__|\|__|\|__|\_________\|__|\|__|
                            \|_________|

EOF

mash () {
  # expects $1 as source directory and $2 as destination directory

  local src_dir="$1"
  local src_files="$(cd $src_dir ; echo *[[:alnum:]])"
  local dst_dir="$2"

  printf "Symlinking files...\n\n"

  for file in $src_files ; do

    local src_path="$SRC_DIR/$file"
    local  dst_path="$DST_DIR/.$file"


    if [ -f "$dst_path" ] ; then

      if [ -h "$dst_path" ] && compare_link "$dst_path" "$src_path" ; then
        # there is already a link to the source file, roll on
        howl_status "Rolling" "$dst_path already links to source file"

      elif [ -h "$dst_path" ] ; then
        # there is a unknown link in place of where the link should go
        howl_warning "$dst_path links to unknown file"

        if prompt_removal "$dst_path" ; then
          link_file "$src_path" "$dst_path"
        else
          howl_failure "$dst_path not linked to source file)"
        fi

      else
        # there is a regular file in place of where the link should go
        howl_warning "$dst_path is an unknown regular file"

        if prompt_removal "$dst_path" ; then
          link_file "$src_path" "$dst_path"
        else
          howl_failure "$dst_path not linked to source file"
        fi

      fi

    else
      # there is nothing in the way of linking the file

      link_file "$src_path" "$dst_path"

    fi

  done

}

mash $SRC_DIR $DST_DIR

printf "\nLinking complete\n"
