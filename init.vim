call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'dense-analysis/ale'
call plug#end()

" Global sets
let mapleader="\<space>"
syntax on
set nu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set hidden
set incsearch
set ignorecase
set smartcase
set nowritebackup
set splitright
set splitbelow
set mouse=a
filetype on
filetype plugin on
filetype indent on

" Use ctr+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Comando find
set path+=**
set wildmenu
set wildignore+=**/node_modules/**

" File manager
nnoremap <Leader>da :Lexplore<CR>
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_winsize=15

" File edition 
nnoremap <Leader>s :vsplit<CR>

" Ale
let b:ale_linters = ['eslint']
let b:ale_linters = {'javascript': ['eslint']}
let g:ale_completion_autoimport = 1

