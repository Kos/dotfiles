set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
"Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kevinw/pyflakes-vim'
Plugin 'fweep/vim-zsh-path-completion'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'glts/vim-textobj-comment'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'mjbrownie/django-template-textobjects'
Plugin 'matchit.zip'
call vundle#end()
filetype on
filetype plugin on

cabbr <expr> %% expand('%:p:h')
syntax on
colorscheme badwolf
autocmd! bufwritepost .vimrc source % "autoreloader
set bs=2 "change backspace behaviour
"let mapleader = ","

inoremap <C-c> <NOP>

"search shortcuts
noremap <C-n> :nohl<CR>

"simpler tab navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
set splitright

nnoremap ; :
nnoremap : ;
nnoremap q; :
xnoremap ; :
xnoremap : ;
xnoremap q; :

set wildmenu wildmode=full "zsh like tab-completion

"indent / unindent"
vnoremap < <gv
vnoremap > >gv

"set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

"cute searching
nnoremap <M-n> nzz
nnoremap <M-N> Nzz


"wrapping, line numbers, cosmetics
set list
set listchars=tab:→\ ,trail:␣
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

set history=700
set undolevels=700
set autoread
set linebreak

"Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set noswapfile

set guioptions=c                  " Get rid of useless GUI elements
set nuw=4
set ruler
set laststatus=2

set clipboard=unnamedplus
if has("gui_running")
  set cursorline
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

set wildignore+=*.pyc
"let g:ctrlp_working_path_mode = 0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"Language specific
autocmd FileType c,cpp,java,python,js,javascript,html autocmd BufWritePre <buffer> :StripWhitespace
