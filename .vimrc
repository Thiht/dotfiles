" Disable the vi-compatibility
set nocompatible

" Temporarily disable filetype detection for Vundle to work properly
filetype off

" Configure Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim

" Plugins to manage
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'ekalinin/dockerfile.vim'
call vundle#end()

" Enable filetype plugins
filetype plugin on
filetype indent on

" Skip vim intro
set shortmess+=I

" Set UTF-8 everywhere
set encoding=utf-8
set fileencoding=utf-8

" Enable line numbers
set number
set relativenumber

" Enable syntax highlight
syntax on

" Set more appropriate color scheme
set background=dark

" Highlight current line
set cursorline
highlight CursorLine cterm=None ctermbg=darkgray

" Enable the use of the mouse in normal, visual, insert and command modes
if has('mouse')
  set mouse=a
endif

" Show the currently typed command
set showcmd

" Automatically re-read a file updated from the outside
set autoread

" Automatically change the current working directory to the current file's
set autochdir

" Allow to visualize all the suggestion when using autocompletion
set wildmenu

" Always show the statusline
set laststatus=2

" Recognize .md files as Markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Set 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4

" Insert spaces instead of tabs
set expandtab
set smarttab

" Copy the indent of the current line when starting a new line
set autoindent

" Enable the incremental search (start searching as you type)
set incsearch

" Ignore case when searching
set ignorecase

" Stop ignoring the case if the search contains upper case characters
set smartcase

" Nicer soft wrap
set linebreak

" Soft wrap marker
set showbreak=↪

" Make Up and Down moves more intuitive
" https://stackoverflow.com/a/21000307/1544176
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Use space as leader key
let mapleader=" "

" Allow to use :w!! to write as root
cmap w!! w !sudo tee > /dev/null %

" Show trailing whitespace
highlight TrailingWhitespace ctermbg=red
match TrailingWhitespace /\s\+$/

" Use F2 to toggle the paste mode in normal mode and in insert mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
