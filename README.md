# lookyhooky/dotfiles

```
      __            __         __                __
     / /___  ____  / /____  __/ /_  ____  ____  / /____  __
    / / __ \/ __ \/ //_/ / / / __ \/ __ \/ __ \/ //_/ / / /
   / / /_/ / /_/ / ,< / /_/ / / / / /_/ / /_/ / ,< / /_/ /
  /_/\____/\____/_/|_|\__, /_/ /_/\____/\____/_/|_|\__, /
                    /____/                       /____/

```

## Purpose

To create a portable set of configuration files that can mash well with others.

## Installation

Clone repo and source `mash.sh` it will link all dotfiles to your home directory. If there is conflict with previous files, there will be chance to remove and link or skip that file.

```bash
git clone https://github.com/lookyhooky/dotfiles.git dotfiles && cd dotfiles && source mash.sh
```

## ToDo

* I believe that `ls` has a different set of commands in linux. I need to compare to OSX, on which this was built.
* I want to break out most of the functions of mash.sh into a separate file to use in different projects.
