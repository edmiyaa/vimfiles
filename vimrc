let g:vimrc_dir = fnamemodify($MYVIMRC, ':p:h')
let g:vim_libs_dir = $HOME . '/vim_libs'
let g:ptpython_config_dir = g:vimrc_dir . '/ptpython'

" External programs/libs
let $PATH .= ';' . g:vimrc_dir . '/plugged/fzf/bin'
let $PATH .= ';' . g:vim_libs_dir . '/node'
let $PATH .= ';' . g:vim_libs_dir . '/ripgrep'
let $PATH .= ';' . g:vim_libs_dir . '/bat'
let $PATH .= ';' . g:vim_libs_dir . '/pixar_usd/lib'
let $PATH .= ';' . g:vim_libs_dir . '/pixar_usd/bin'
let $PYTHONPATH .= ';' . g:vim_libs_dir . '/pixar_usd/lib/python'
let $PYTHONHOME = $HOME . '/vim_pyenv'
let $PATH .= ';' . $PYTHONHOME . '/Scripts'

" Redefine mapleader before installing any plugins
let mapleader = "\<Space>"

"####################
"# INSTALL VIM-PLUG #
"####################

let vimplug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let vimplug_path = g:vimrc_dir . '/autoload/plug.vim'
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
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
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

let g:which_key_map.b = {
    \ 'name': '+buffers',
    \ 'b': 'switch to buffer',
\ }

let g:which_key_map.c = {
    \ 'name': '+code',
    \ 'g': {
    \     'name': '+go_to',
    \     'd': 'definition of symbol under cursor',
    \ },
    \ 'l': {
    \     'name': '+list',
    \     'i': 'incoming calls',
    \     'o': 'outgoing calls',
    \     'r': 'references',
    \ },
    \ 'r': {
    \     'name': '+refactor',
    \     'r': 'refactor symbol under cursor',
    \ },
    \ 'o': 'outline',
    \ 'x': {
    \     'name': '+execute',
    \     'p': 'save and execute with python',
    \ },
\ }

let g:which_key_map.e = {
    \ 'name': '+edit',
    \ 'c': 'from clipboard',
    \ 'h': 'from history',
    \ 's': 'save and source current file',
    \ 'v': '$MYVIMRC',
\ }

let g:which_key_map.f = {
    \ 'name': '+find',
    \ 'f': {
    \     'name': '+files',
    \     'v': '$MYVIMRC directory',
    \ },
\ }

let g:which_key_map.g = {
    \ 'name': '+git',
    \ 'd': 'diff with original',
    \ 'f': 'diff fold',
    \ 'g': 'G',
\ }

let g:which_key_map.n = {
    \ 'name': 'nerdtree',
\ }

let g:which_key_map.p = {
    \ 'name': '+python',
    \ 'r': 'repl',
\ }

let g:which_key_map.t = {
    \ 'name': '+tabs',
    \ 'c': 'create tab',
    \ 'd': 'delete tab',
    \ 'n': 'next tab',
    \ 'p': 'previous tab',
\ }

"################
"# vim-fugitive #
"################

nnoremap <leader>gg :vertical botright G<CR>

"#################
"# vim-gitgutter #
"#################

let g:gitgutter_map_keys = 0

nnoremap <leader>gd :GitGutterDiffOrig<CR>
nnoremap <leader>gf :GitGutterFold<CR>

"############
"# coc.nvim #
"############

inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : '<tab>'
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <leader>crr :call CocAction('refactor')<CR>
nnoremap <leader>cgd :call CocAction('jumpDefinition')<CR>
nnoremap <leader>cli :call CocAction('showIncomingCalls')<CR>
nnoremap <leader>clo :call CocAction('showOutgoingCalls')<CR>
nnoremap <leader>clr :call CocAction('jumpReferences')<CR>
nnoremap <leader>co :CocOutline<CR>

"###########
"# fzf.vim #
"###########

let $FZF_DEFAULT_OPTS='--reverse --exact'

fun! SearchInFiles(...)
    let rootdir = get(a:, 1, '.')
    let pattern = input('Pattern: ')
    execute 'cd ' . rootdir
    execute 'Rg! ' . pattern
endf

fun! SearchFiles(...)
    let rootdir = get(a:, 1, '.')
    execute 'cd ' . rootdir
    Files!
endf

nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>eh :History<CR>
nnoremap <leader>ffv :call SearchFiles(g:vimrc_dir)<CR>

"############
"# nerdtree #
"############
"
nnoremap <leader>n :NERDTree<CR>

"##################
"# GENERAL CONFIG #
"##################

syntax on
filetype plugin indent on
colorscheme gruvbox

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

nnoremap <leader>ev :e! $MYVIMRC<CR>
nnoremap <leader>ec :exec 'e ' . trim(@*, "\"'")<CR>
nnoremap <leader>es :w<CR>:source %<CR>
nnoremap <leader>cxp :w<CR>:!python %<CR><CR>
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leadeR>pr :exec 'vertical botright terminal ptpython --config-dir=' . ptpython_config_dir<CR>

