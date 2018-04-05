if exists("g:loaded_coherent_search") | finish | endif
let g:loaded_coherent_search = 1

augroup CoherentSearch
  autocmd!
  autocmd User Grepper call hint#prepare_highlights()
augroup END
