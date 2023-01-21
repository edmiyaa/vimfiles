" Redefine mapleader before installing any plugins
let mapleader=' '

" Install Plugins
let plugvim_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let plugvim_path = fnamemodify($MYVIMRC, ':p:h') . '/autoload/plug.vim'
let init=0

" If vim-plug is not installed, then assume no plugins exist
if !filereadable(plugvim_path)
    " Download vim-plug and place it inside $MYVIMRC/autoload/
    silent exec '!curl -fLo ' . plugvim_path . ' --create-dirs ' . plugvim_url
    " Set the flag to download plugins
    let init=1
endif

" Define plugins to be used
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
call plug#end()

" If vim-plug was just installed, proceed to download plugins
if init==1
    PlugInstall
endif

" Fzf.vim
let default_fzf_options = '--exact --reverse'
let g:fzf_buffers_options = default_fzf_options
let g:fzf_files_options = default_fzf_options
let g:fzf_history_options = default_fzf_options
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>

" GitGutter
" Reduce delay between GitGutter updates
set updatetime=100
" Remove extra empty column when gutters are shown
set numberwidth=1

" Fugitive
nnoremap <leader>g :vertical botright G<CR>

" EasyMotion
nnoremap s  <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" NerdCommenter
let g:NERDSpaceDelims = 1

" Coc.nvim
inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "<tab>"

" VimMarkdown
let g:vim_markdown_folding_disabled = 1
autocmd filetype markdown set conceallevel=2

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
set signcolumn=yes
set belloff=all
set mouse=
set backspace=indent,eol,start

"Start Vim in fullscreen
au GUIEnter * simalt ~x

nnoremap <leader>ev :e! $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>of :exec 'e ' . trim(@*, "\"'")<CR>

autocmd BufRead,BufNewFile *.usda set filetype=usda

