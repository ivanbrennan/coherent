if exists("g:loaded_coherent_mline") | finish | endif
let g:loaded_coherent_mline = 1

if v:vim_did_enter
  call s:init()
else
  augroup Mline
    autocmd!
    autocmd VimEnter * call mline#init()
  augroup END
endif
