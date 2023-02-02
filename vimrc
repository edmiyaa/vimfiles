" Redefine mapleader before installing any plugins
let mapleader = "\<Space>"

"####################
"# INSTALL VIM-PLUG #
"####################

let vimplug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let vimplug_path = fnamemodify($MYVIMRC, ':p:h') . '/autoload/plug.vim'
let init = 0

" If vim-plug is not installed, assume this is a new Vim installation
if !filereadable(vimplug_path)
    " Download vim-plug and place it inside $MYVIMRC/autoload/
    silent exec '!curl -fLo ' . vimplug_path . ' --create-dirs ' . vimplug_url
    " Set the init flag to download and install plugins
    let init = 1
endif

"###################
"# INSTALL PLUGINS #
"###################

" Define plugins to be used
call plug#begin()
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
call plug#end()

" Install plugins if the init flag was set
if init == 1
    silent PlugInstall
endif

"#################
"# vim-which-key #
"#################

nnoremap <silent><leader> :<c-u>WhichKey '<Leader>'<CR>
call which_key#register('<Space>', 'g:which_key_map')

let g:which_key_map = {}

let g:which_key_map.e = {
    \ 'name': 'Edit Files',
    \ 'v': 'Edit $MYVIMRC',
    \ 'c': 'Edit file from clipboard',
    \ 'h': 'Edit file from history',
\ }

let g:which_key_map.c = {
    \ 'name': 'Config',
    \ 'v': 'Source $MYVIMRC',
\ }

let g:which_key_map.b = {
    \ 'name': 'Buffers',
    \ 'b': 'Switch to buffer',
\ }

let g:which_key_map.g = {
    \ 'name': 'Git',
    \ 'g': 'VimFugitive',
\ }

"#################
"# vim-gitgutter #
"#################

let g:gitgutter_map_keys = 0

"############
"# coc.nvim #
"############

inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "<tab>"

"###########
"# fzf.vim #
"###########

let $FZF_DEFAULT_OPTS='--reverse --exact'

"#############
"# SHORTCUTS #
"#############

nnoremap <leader>ev :e! $MYVIMRC<CR>
nnoremap <leader>cv :source $MYVIMRC<CR>
nnoremap <leader>ec :exec 'e ' . trim(@*, "\"'")<CR>

nnoremap <leader>gg :vertical botright G<CR>

nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>eh :History<CR>

"##################
"# GENERAL CONFIG #
"##################

syntax on
filetype plugin indent on
colorscheme slate

"Start Vim in fullscreen mode
autocmd GUIEnter * simalt ~x

set guioptions=
set guifont=Consolas:h11
set shortmess=I
set number
set relativenumber
set colorcolumn=100

set wildmenu
set wildmode=longest,list

set list
set listchars=tab:→\ ,trail:·

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set ignorecase
set incsearch
set hlsearch

set autoindent
set belloff=all
set autochdir
set backspace=indent,eol,start
set mouse=
set noswapfile
set nostartofline
set nowrap
set signcolumn=yes
set timeoutlen=500
set updatetime=100
set numberwidth=1
set clipboard=unnamed

