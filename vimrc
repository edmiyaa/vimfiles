syntax on
filetype plugin indent on
colorscheme ron

set number
set colorcolumn=100
set guioptions=
set guifont=Consolas:h11
set shortmess=I

set list
set listchars=tab:→\ ,trail:·

set ignorecase
set smartcase
set hlsearch
set incsearch

set wildmenu
set wildmode=longest,list

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autochdir
set shellslash
set nostartofline
set backspace=indent,eol,start

let mapleader=' '
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sh :set hlsearch!<CR>
nnoremap <leader>of :exec 'e ' . trim(@*, "\"'")<CR>

