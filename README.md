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

Clone repo and source `mash.sh`. It will link all *dotfiles* to your home directory. If there is conflict with a previous installed file, there will be a chance to remove and link to *dotfiles* or skip that file.

```bash
git clone https://github.com/lookyhooky/dotfiles.git dotfiles && cd dotfiles && source mash.sh
```

## ToDo

* Break mash out into a script that can be used to merge files in a sane way.
