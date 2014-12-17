#!/usr/bin/env bash
# easy.sh by lookyhooky
#   _______   ________  ________       ___    ___
#  |\  ___ \ |\   __  \|\   ____\     |\  \  /  /|
#  \ \   __/|\ \  \|\  \ \  \___|_    \ \  \/  / /
#   \ \  \_|/_\ \   __  \ \_____  \    \ \    / /
#    \ \  \_|\ \ \  \ \  \|____|\  \    \/  /  /
#     \ \_______\ \__\ \__\____\_\  \ __/  / /
#      \|_______|\|__|\|__|\_________\\___/ /
#                         \|_________\|___|/

set -e

error_exit () {
  # expects $1 as a string representing an error message

  echo "$1" 1>&2
  exit 1

}

inject_color() {
  # expects $1 as a string to inject with color and $2 as a ancii color code

  local palette="1"

  echo -e "\\033[$palette;$2m$1\\033[0m"

}

is_integer() {
  # test $1 for being a number
  local reg='^[0-9]+$'

  if [[ $1 =~ $reg ]] ; then
    return 0
  else
    return 1
  fi

}

inject_8bit() {
  # expects $1 as string to inject, $2 as a forground color
  local foreground="38;5;$2m"
  # local background="48;5;$3m"

  if is_integer $2 ; then
    echo -e "\033[$foreground$1\033[m"
  else
    echo -e "$1"
  fi

}

howl () {
  # expects $1 as flash $2 as ancii color code and $3 as message
  echo -e "[$(inject_8bit $1 $2)] $3"
}
howl_failure () {
  # expects $1 as message
  howl "Failure" 160 "$1"
}
howl_warning () {
  # expects $1 as message
  howl "Warning" 208 "$1"
}
howl_success () {
  # expects $1 as flash and $2 as message
  howl "Success" 34 "$1"
}
howl_status () {
  # expects $1 as flash and $2 as message
  howl "$1" 36 "$2"
}

compare_link () {
  # expects $1 as destination file expects $2 as source file path

  if [ "$(readlink $1)" == "$2" ] ; then
    return 0
  else
    return 1
  fi

}

link_file () {
  # expects $1 as source file and $2 as destination file

  ln -s "$1" "$2"
  howl_success "$2 linked to source"

}

prompt_removal () {
  # expects $1 as a path to the file to remove

  while true; do
    read -p "Do you wish to remove $1? " yn

    case $yn in
      [Yy]* )
        rm $1
        howl_success "$1 removed"
        return 0;;
      [Nn]* )
        howl_failure "$1 not removed"
        return 1;;
      *)
        howl_failure "Please answer 'yes' or 'no'";;
    esac

  done

}
