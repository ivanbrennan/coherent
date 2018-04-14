if exists("g:loaded_coherent_search") | finish | endif
let g:loaded_coherent_search = 1

let g:fzf_colors =
\ { 'prompt':  ['fg', 'LineNr'] }

let g:grepper =
\ { 'next_tool': '<Bslash><Bslash>' }

augroup CoherentSearch
  autocmd!
  autocmd User Grepper call hint#prepare_highlights()
  autocmd User Hint,listical_next,listical_prev call coherent#offset()
augroup END
