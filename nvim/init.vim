call plug#begin()
Plug 'leafgarland/typescript-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'mattn/emmet-vim'
call plug#end()

" Auto-pairs settings
let g:AutoPairsFlyMode=0

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
set shiftwidth=4 tabstop=4 expandtab

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
