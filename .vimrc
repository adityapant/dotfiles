syntax on " Turn on syntax highlighting
filetype indent on " Activates indenting for files
set number " Show line numbers
set relativenumber " Show relative numbers
set ruler " Show file stats
set encoding=utf-8
set backspace=2 " Backspace in insert mode works like normal editor
set autoindent
set nobackup " Get rid of annoying ~file
set laststatus=2
set statusline+=%F:%l
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

call plug#begin()
Plug 'preservim/nerdcommenter'
call plug#end()
