"""Plugins"""

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


"""Sanity - Minimum Viable Editor"""

set nocompatible
syntax on
set bs=2   "free backspace
set history=770 undolevels=770
set autoread noswapfile  "open and save handling
set clipboard=unnamedplus  "use system clipboard as default register
set guioptions=c  "get rid of useless GUI elements
set number nuw=4  "gutter
set ruler laststatus=2  "status line
set hlsearch incsearch  "searching tweaks
set ignorecase smartcase  "case insensitive searching by default
set list listchars=tab:→\ ,trail:·  "display whitespace
set nowrap linebreak  "soft text wrapping - linebreak conflicts with list :(
set textwidth=79 colorcolumn=80 formatoptions=q  "hard text wrapping and formatting
highlight ColorColumn ctermbg=233
set autoindent expandtab tabstop=4 softtabstop=4 shiftwidth=4   "spaces and tabs hygiene
autocmd! bufwritepost .vimrc source % "autoreloader
set wildmenu wildmode=full  "zsh like tab-completion


"""Ergonomics"""

"No more shift for ex commands!
nnoremap ; :
nnoremap : ;

"Simpler tab navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w><c-h>
set splitright

"Bad habit
inoremap <C-c> <NOP>

"Cute searching
noremap <C-n> :nohl<CR>
nnoremap <M-n> nzz
nnoremap <M-N> Nzz

"indent / unindent"
vnoremap < <gv
vnoremap > >gv

cabbr <expr> %% expand('%:p:h')


"""Lipstick"""

colorscheme badwolf
if has("gui_running")
  set cursorline
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


"""Language specific"""

autocmd FileType c,cpp,java,python,js,javascript,html autocmd BufWritePre <buffer> :StripWhitespace
set wildignore+=*.pyc


"""Plugin specific"""

"let g:ctrlp_working_path_mode = 0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
