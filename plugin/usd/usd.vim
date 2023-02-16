let $PYTHONPATH .= ';' . fnamemodify($MYVIMRC, ':p:h') . '/plugin/usd/py'

func! UsdSearchAssetPath()
    let @/ = '@\zs.*\ze@'
    execute "normal /\<CR>"
endf

func! InitUsdVim()
    py import usd; reload(usd)
endf

func! UsdListDependencies(usdpath)
    call InitUsdVim()
    py usd.list_usd_dependencies(usd.vim.eval('a:usdpath'))
endf

func! ConvertUsdcToUsda()
    silent execute '%!usdcat ' . expand('%:p')
endf

func! ConvertUsdaToUsdc()
    let tempfile = tempname() . '.usda'
    call writefile(getline(1, '$'), tempfile)
    silent execute '!usdcat -o ' . expand('%:p') . ' ' . tempfile
endf

let g:which_key_map.u = {
    \ 'name': '+usd',
    \ 'l': {
    \     'name': '+list',
    \     'd': 'dependencies of current file',
    \ },
    \ 's': {
    \     'name': '+search',
    \     'a': 'asset path',
    \ },
\ }

nnoremap <leader>uld :call UsdListDependencies(expand('%:p'))<CR>
nnoremap <leader>usa :call UsdSearchAssetPath()<CR>

autocmd BufRead *.usdc call ConvertUsdcToUsda()
" cabbrev <buffer> w call ConvertUsdaToUsdc()

