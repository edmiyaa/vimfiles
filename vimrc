let mapleader=' '

" Install Plugins
let plugvim_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let plugvim_path = fnamemodify($MYVIMRC, ':p:h') . '/autoload/plug.vim'
let init=0

if !filereadable(plugvim_path)
    silent exec '!curl -fLo ' . plugvim_path . ' --create-dirs ' . plugvim_url
    let init=1
endif

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

if init==1
    PlugInstall
endif

" GitGutter
" Reduce delay between GitGutter updates
set updatetime=100
" Remove extra empty column when gutters are shown
set numberwidth=1

" Fugitive
nnoremap <leader>g :vertical botright G<CR>


" General Config
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

set wildmenu
set wildmode=longest,list

set nowrap
set autochdir
set shellslash
set nostartofline
set noswapfile
set backspace=indent,eol,start
au GUIEnter * simalt ~x "Start Vim in fullscreen

nnoremap <leader>ev :e! $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>of :exec 'e ' . trim(@*, "\"'")<CR>

