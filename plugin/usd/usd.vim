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

func! Usdc2Usda()
    silent execute '%!usdcat ' . expand('%:p')
endf

func! Usda2Usdc()
    let tempfile = tempname() . '.usda'
    call writefile(getline(1, '$'), tempfile)
    silent execute '!usdcat -o ' . expand('%:p') . ' ' . tempfile
endf

let g:which_key_map.u = {
    \ 'name': '+usd',
    \ 'l': {
    \     'name': '+list',
    \     'd': [':call UsdListDependencies(expand("%:p"))', 'dependencies of current file'],
    \ },
    \ 's': {
    \     'name': '+search',
    \     'a': [':call UsdSearchAssetPath()', 'asset path'],
    \ },
\ }

autocmd BufRead *.usdc call Usdc2Usda()

