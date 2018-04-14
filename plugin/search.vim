if exists("g:loaded_coherent_search") | finish | endif
let g:loaded_coherent_search = 1

augroup CoherentSearch
  autocmd!
  autocmd User Grepper call hint#prepare_highlights()
  autocmd User Hint,listical_next,listical_prev call coherent#offset()
augroup END
