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
    \ 'b': ['Buffers', 'switch to buffer'],
\ }

let g:which_key_map.c = {
    \ 'name': '+code',
    \ 'g': {
    \     'name': '+go_to',
    \     'd': [':call CocAction("jumpDefinition")', 'definition of symbol under cursor'],
    \ },
    \ 'l': {
    \     'name': '+list',
    \     'i': [':call CocAction("showIncomingCalls")', 'incoming calls'],
    \     'o': [':call CocAction("showOutgoingCalls")', 'outgoing calls'],
    \     'r': [':call CocAction("jumpReferences")', 'references'],
    \ },
    \ 'r': {
    \     'name': '+refactor',
    \     'r': [':call CocAction("refactor")', 'refactor symbol under cursor'],
    \ },
    \ 'o': ['CocOutline', 'outline'],
    \ 'x': {
    \     'name': '+execute',
    \     'p': [':w | :!python %', 'save and execute with python'],
    \ },
\ }

let g:which_key_map.e = {
    \ 'name': '+edit',
    \ 'c': [':call EditFromClipboard()', 'edit from clipboard'],
    \ 'h': ['History', 'edit from history'],
    \ 'v': [':e! $MYVIMRC', '$MYVIMRC'],
\ }

let g:which_key_map.f = {
    \ 'name': '+find',
    \ 'f': {
    \     'name': '+files',
    \     'v': [':call SearchFiles(g:vimrc_dir)', '$MYVIMRC directory'],
    \ },
\ }

let g:which_key_map.g = {
    \ 'name': '+git',
    \ 'd': ['GitGutterDiffOrig', 'diff with original'],
    \ 'f': ['GitGutterFold', 'diff fold'],
    \ 'g': [':vertical botright G', 'G'],
\ }

let g:which_key_map.m = {
    \ 'name': '+misc',
    \ 'c': [':call CopyCurrentFilepath()', 'copy current filepath'],
    \ 'e': [':!start explorer /select,%:p', 'show current file in windows explorer'],
    \ 's': [':w | :source %', 'save and source current file'],
\ }

let g:which_key_map.n = ['NERDTree', 'nerdtree']

let g:which_key_map.p = {
    \ 'name': '+python',
    \ 'r': [':vertical botright terminal ptpython --config-dir=ptpython_config_dir', 'repl'],
\ }

let g:which_key_map.t = {
    \ 'name': '+tabs',
    \ 'n': ['tabnew', 'new tab'],
    \ 'c': ['tabclose', 'close tab'],
    \ '>': ['tabnext', 'next tab'],
    \ '<': ['tabprevious', 'previous tab'],
\ }

"#################
"# vim-gitgutter #
"#################

let g:gitgutter_map_keys = 0

"############
"# coc.nvim #
"############

inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : '<tab>'
autocmd CursorHold * silent call CocActionAsync('highlight')

"###########
"# fzf.vim #
"###########

let $FZF_DEFAULT_OPTS='--reverse --exact'

" TODO: Restore cwd after Rg command is called
fun! SearchInFiles(...)
    let rootdir = get(a:, 1, '.')
    let pattern = input('Pattern: ')
    execute 'cd ' . rootdir
    execute 'Rg! ' . pattern
endf

" TODO: Restore cwd after Files command is called
fun! SearchFiles(...)
    let rootdir = get(a:, 1, '.')
    execute 'cd ' . rootdir
    Files!
endf

"##################
"# GENERAL CONFIG #
"##################

syntax on
filetype plugin indent on
colorscheme retrobox

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

"####################
"# CUSTOM FUNCTIONS #
"####################

fun! CopyCurrentFilepath()
    let current_filepath = expand("%:p")
    let @* = current_filepath
    echom 'Copied current filepath: ' . current_filepath
endf

fun! EditFromClipboard()
    let path = trim(@*, "\"'")
    exec 'silent e ' . path
    echom 'Editing path from clipboard: ' . path
endf

