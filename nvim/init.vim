call plug#begin()
" Automatic close parens
Plug 'jiangmiao/auto-pairs'

" Typescript syntax highlighting
Plug 'leafgarland/typescript-vim'

" Vue.js syntax highlighting
Plug 'leafOfTree/vim-vue-plugin'

" Web development auto-completion
Plug 'mattn/emmet-vim'

" Fuzzy finding and buffer management
Plug 'Shougo/denite.nvim'

" Intellisense code engine, auto-completion, linting, code fixing
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
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


" Auto-pairs settings
let g:AutoPairsFlyMode=0


" Denite settings
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>


" Coc settings
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)


" Avoid cached files littering up filesystem
let g:netrw_home=$XDG_CACHE_HOME . '/vim'
