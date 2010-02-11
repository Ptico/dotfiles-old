set nocompatible				" No compatible with Vi
set encoding=utf-8 nobomb		" BOM often causes trouble

set keymap=russian-jcukenwin	" Russian keymap
set iminsert=0					" Latin keymap by default
set imsearch=0					" Latin keymap for search

set t_Co=256					" Set to use 256 colors
colorscheme desert256

set nobackup
set nowritebackup

syntax on
set ruler						" Show the cursor position all the time
set number						" Show line numbering
set showmode					" Show the current mode
set expandtab
set tabstop=2

filetype on

" Search
set incsearch					" Incremental search
set hlsearch					" Highlight search
set ignorecase					" ignore case when searching
set smartcase					" override ignorecase when there are uppercase characters

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>	<C-C>:update<CR>
inoremap <C-S>	<C-O>:update<CR>
 
" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG
