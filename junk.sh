list_of_files_in_home="$(ls -1AF $DST_DIR | grep -Ev '/$' )"

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
