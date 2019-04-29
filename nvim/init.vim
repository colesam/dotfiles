call plug#begin()
call plug#end()

" Vimsentials
set nocompatible
set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set nohlsearch
set number relativenumber
filetype indent plugin on
syntax on

" Default tab settings
set shiftwidth=4 softtabstop=4 expandtab

" Wildmenu
set wildmenu
set wildignore+=**/node_modules/**

" Colorscheme
colorscheme gruvbox

" Key mapping
inoremap jj <Esc>
cnoremap $t <cr>:t''<cr>
nnoremap Y y$

" Fuzzy file searching
set path+=**

" C tags setup
command! MakeTags !ctags -R .

" Avoid cached files littering up filesystem
let g:netrw_home=$XDG_CACHE_HOME . '/vim'
