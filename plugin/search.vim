if exists("g:loaded_coherent_search") | finish | endif
let g:loaded_coherent_search = 1

let g:fzf_colors =
\ { 'prompt':  ['fg', 'LineNr'] }

let $FZF_DEFAULT_OPTS = $FZF_DEFAULT_OPTS . ' --reverse'

let g:fzf_preview_window = ['right:50%:hidden:+{2}-/2', 'ctrl-h']

" The default is a popup window, which looks cool, but has some issues,
" such as breaking alt bindings (--bind=alt-p:previous-history) and causing
" the cursor to jump to the top of the file if projectionist is enabled.
" https://github.com/junegunn/fzf.vim/issues/1164
let g:fzf_layout = { 'down': '50%' }

let g:grepper =
\ { 'next_tool': '<Bslash><Bslash>' }

augroup CoherentSearch
  autocmd!
  autocmd User Grepper call hint#prepare_highlights()
  autocmd User Hint,listical_next,listical_prev Latitude
augroup END
