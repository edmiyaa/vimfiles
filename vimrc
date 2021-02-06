set encoding=utf-8

let mapleader=' '

try
    let plugvim_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    let plugvim_path=$HOME . '/vimfiles/autoload/plug.vim'
    let first_install=0

    if empty(glob(plugvim_path))
        silent exec '!curl -fLo ' . plugvim_path . ' --create-dirs ' . plugvim_url
        let first_install=1
    endif

    call plug#begin()
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'vim-python/python-syntax'
    Plug 'easymotion/vim-easymotion'
    call plug#end()

    if first_install==1
        PlugInstall
    endif

    let g:lightline={'colorscheme':'onedark'}
    let g:python_highlight_all=1
    let g:EasyMotion_smartcase=1
    map <M-;> <Plug>(easymotion-overwin-f2)
    colorscheme onedark
catch
    colorscheme ron
    "echo 'EXCEPTION: ' . v:exception
endtry

if has('gui_running')
    set guioptions=
    set guifont=JetBrains\ Mono:h12,Lucida\ Console:h12
endif

syntax on
filetype plugin indent on

set number
set colorcolumn=80
set list
set listchars=tab:▸\ ,trail:▫
set backspace=indent,eol,start
set autochdir
set shellslash
set nostartofline
set laststatus=2
set shortmess=I

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set wildmenu
set wildmode=longest,list

set ignorecase
set smartcase
set hlsearch
set incsearch

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sh :set hlsearch!<CR>
nnoremap <leader>xp :w<CR>:!python %<CR><CR>

