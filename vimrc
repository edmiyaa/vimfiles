syntax on
filetype plugin indent on
colorscheme slate
set number
set guioptions=
set guifont=Consolas:h11
set shortmess=I
set colorcolumn=100

set ignorecase
set smartcase
set hlsearch
set incsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set list
set listchars=tab:→\ ,trail:·

set autochdir
set shellslash
set nostartofline
set backspace=indent,eol,start
au GUIEnter * simalt ~x "Start Vim in fullscreen

let mapleader=' '
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>of :exec 'e ' . trim(@*, "\"'")<CR>

