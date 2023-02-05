 func! UsdSearchAssetPath()
     let @/ = '@\zs.*\ze@'
     execute "normal /\<CR>"
 endfun

let g:which_key_map.u = {
    \ 'name': '+usd',
    \ 's': {
    \     'name': '+search',
    \     'a': 'asset path',
    \ },
\ }
 
 nnoremap <leader>usa :call UsdSearchAssetPath()<CR>

