" Plugins
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'fatih/molokai'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-surround'
Plug 'sotte/presenting.vim'
call plug#end()

"=====================================================
"===================== SETTINGS ======================

set nocompatible
filetype off
filetype plugin indent on

set ttyfast

if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=3
endif

set relativenumber " Show relative numbers
set tabstop=4
set shiftwidth=4
set expandtab
set ruler " Show file stats
set laststatus=2
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent                  
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
" set mouse=a                     "Enable mouse mode

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden
set scrolloff=5              " Offset

set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

set lazyredraw

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" increase max memory to show syntax highlighting for large files 
set maxmempattern=20000

" ~/.viminfo needs to be writable and readable. Set oldfiles to 1000 last
" recently opened files, :FzfHistory uses it
set viminfo='1000

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" color
syntax enable
set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

augroup filetypedetect
	autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = " "

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Clear highlight
nnoremap <CR> :noh<CR><CR>

" Autocomplete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>


" ==================== FZF ====================
noremap <C-p> :Files<CR>

" ==================== NerdTree ====================
" For toggling
noremap <leader>n :NERDTreeToggle<cr>
" noremap <leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

" ==================== UltiSnips ===================
let g:UltiSnipsExpandTrigger='<C-Space>' " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger='<c-j>' " shortcut to go to next position
let g:UltiSnipsJumpBackwardTrigger='<c-k>' " shortcut to go to previous position
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

" ==================== vim-go ====================
let g:go_version_warning = 0
" let g:go_fmt_command = "goimports"
" let g:go_fmt_fail_silently = 1
" let g:go_addtags_transform = "camelcase"
" let g:go_highlight_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

let g:go_null_module_warning = 0
let g:go_echo_command_info = 1

let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

let g:go_info_mode = 'gopls'
let g:go_rename_command='gopls'
let g:go_gopls_complete_unimported = 1
let g:go_implements_mode='gopls'
let g:go_diagnostics_enabled = 1
let g:go_doc_popup_window = 1

let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

augroup go
	autocmd!

	autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
	autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
	autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)

	autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

	autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
	autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

	autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
	autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
	autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

	autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
	autocmd FileType go nmap <silent> <Leader>o :GoDecls<CR>

	" I like these more!
	autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
	autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
	autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
	autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END
