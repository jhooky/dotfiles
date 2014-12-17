#!/usr/bin/env bash
# mash.sh by lookyhooky
#                        __    
#   ///\\ ///||| ///||///  \\\||  |||
#  ///  \\// |||/// ||\\\__  |||  |||
# ///    //  ||///==|||    \\\||==|||
#///         |///   ||\\\__///||  |||.sh

set -e

RCol='\\033[0m'    # Text Reset

# Regular      
Bla='\\033[0;30m';
Red='\\033[0;31m';
Gre='\\033[0;32m';
Yel='\\033[0;33m';
Blu='\\033[0;34m';
Pur='\\033[0;35m';
Cya='\\033[0;36m';
Whi='\\033[0;37m';

SRC_DIR="$(pwd)/src"    # source directory
DST_DIR="$HOME"         # destination directory

PALETTE_STRONG="1"
PALETTE_NORMAL="0"

colortext() {
  echo -e "\\033[$PALETTE_STRONG;$2m$1\\033[0m"
}

error_exit () {
  # expecrs $1 as a string representing an error message
  
  echo "$1" 1>&2
  exit 1
  
}

send_message () {
  # expects $1 as flash $2 as ansi color code and $3 as message
  
  echo -e "[$(colortext $1 $2)] $3"
  
}

compare_link () {
  # expects $1 as destination directory expects $2 as source file path

  link_path="$(ls -Al $1 | grep -Eo $2 )"

  if [ "$link_path" == "$2" ] ; then
    return 0
  else
    return 1
  fi
  
}

link_file () {
  # expects $1 as source file and $2 as destination file
  
  ln -s $1 $2
  send_message "Success" "32" "$2 linked to source"
  
}

prompt_removal () {
  # expects $1 as a path to the file to remove
  
  while true; do
    read -p "Do you wish to remove $1? " yn

    case $yn in
      [Yy]* )
        rm $1
        send_message "Success" "32" "$1 removed"
        return 0;;
      [Nn]* )
        send_message "FAILURE" "31" "$1 not removed"
        return 1;;
      *)
        send_message "FAILURE" "31" "Please answer 'yes' or 'no'";;
    esac
    
  done

}


cat << "EOF"

Welcome to lookyhooky/dotfiles... may they mash well with yours

                         __    
    ///\\ ///||| ///||///  \\\||  |||
   ///  \\// |||/// ||\\\__  |||  |||
  ///    //  ||///==|||    \\\||==|||
 ///         |///   ||\\\__///||  |||.sh
                                               
EOF
echo "Symlinking dotfiles... "

src_files="$(ls -1F $SRC_DIR)"

for file in $src_files ; do

  src_path="$SRC_DIR/$file"
  dst_path="$DST_DIR/.$file"
  
  if [ -f $dst_path ] ; then

    if [ -h $dst_path ] && compare_link $DST_DIR $src_path ; then
      # there is already a link to the source file, roll on
      send_message "Rolling" "36" "$dst_path links to source file"
      
    elif [ -h $dst_path ] ; then
      # there is a unknown link in place of where the link should go
      send_message "Warning" "33" "$dst_path links to unknown file"
      
      if prompt_removal $dst_path ; then
        link_file $src_path $dst_path
      else
        send_message "FAILURE" "31" "$dst_path not linked to source file"
      fi
       
    else
      # there is a regular file in place of where the link should go
      send_message "Warning" "33" "$dst_path is an unknown regular file"

      if prompt_removal $dst_path ; then
        link_file $src_path $dst_path
      else
        send_message "FAILURE" "31" "dst_path not linked to source file"
      fi

    fi
   
  else
    # there is nothing in the way of linking the file
    
    link_file $src_path $dst_path
    
  fi 
    
done

cat <<EOF

Boy! That was painless!

EOF
# list_of_files_in_home="$(ls -1AF $DST_DIR | grep -Ev '/$' )"

