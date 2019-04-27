" Vimsentials
set nocompatible
filetype indent plugin on
syntax on

set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set nohlsearch
set number relativenumber
set wildmenu

" Colorscheme
colorscheme forest-night

" Key mapping
inoremap jj <Esc>
cnoremap $t <cr>:t''<cr>
nnoremap Y y$

" Avoid cached files littering up filesystem
let g:netrw_home=$XDG_CACHE_HOME . '/vim'
