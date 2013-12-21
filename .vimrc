" Make Vim more useful
set nocompatible
" Enable syntax highlighting
syntax on
" Enable line numbers
set number
" Break lines at word (requires Wrap lines)
set linebreak
" Wrap-broken line prefix
set showbreak=+++
" Line wrap (number of cols)
set textwidth=100
" Don’t add empty newlines at the end of files
set binary
set noeol
" Highlight matching brace
set showmatch
" Disable error bells
set noerrorbells
" Highlight all search results
set hlsearch
" Highlight dyamically as pattern is typed
set incsearch 
" Enable smart-case search
set smartcase
" add g flag to search and replace
set gdefault
" Ingnore case of searches				
set ignorecase
" Searches for strings incrementally
set incsearch
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Make tabs as wide as two spaces
set tabstop=2
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
 " Show row and column ruler information
set ruler
" Number of undo levels
set undolevels=1000
" Allow backspace in insert mode
set backspace=indent,eol,start
