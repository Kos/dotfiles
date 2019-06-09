"""Plugins"""

set nocompatible
filetype on
filetype plugin on
filetype indent on


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
set textwidth=79 formatoptions=q  "hard text wrapping and formatting
"set textwidth=79 colorcolumn=80 formatoptions=q  "hard text wrapping and formatting
"highlight ColorColumn ctermbg=233
set autoindent expandtab tabstop=2 softtabstop=2 shiftwidth=2   "spaces and tabs hygiene
autocmd! bufwritepost .vimrc source % "autoreloader
set wildmenu wildmode=longest,full  "zsh like tab-completion
set tags=tags;


"""Ergonomics"""

"Simpler tab navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w><c-h>
set splitbelow splitright

"Cute searching
noremap <C-n> :nohl<CR>
nnoremap <M-n> nzz
nnoremap <M-N> Nzz

"indent / unindent"
vnoremap < <gv
vnoremap > >gv

cabbr <expr> %% expand('%:p:h')

nnoremap <C-tab> <C-^>


"""Language specific"""

" DisableWhitespace  "listchars gets the job done
"autocmd FileType c,cpp,java,python,js,javascript,html autocmd BufWritePre <buffer> :StripWhitespace
autocmd FileType python set ts=4 sts=4 sw=4
set wildignore+=*.pyc
let NERDTreeIgnore=['\~$', '.pyc$', '^__pycache__$']

" Codility
set path+=~/codility/frontend_v2/codility/templates
set path+=~/codility/frontend_v2/codility/static
set path+=~/codility/frontend_v2/codility/cui/static
set path+=~/codility/frontend_v2/codility/cui/templates
