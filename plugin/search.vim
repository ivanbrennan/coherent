if exists("g:loaded_coherent_search") | finish | endif
let g:loaded_coherent_search = 1

let g:fzf_colors = { 'prompt':  ['fg', 'LineNr'] }

let s:fzf_preview_window = 'right:50%:hidden:+{2}-/2'
let s:fzf_preview_toggle = 'ctrl-h'
let g:fzf_preview_window = [s:fzf_preview_window, s:fzf_preview_toggle]

" The default is a popup window, which looks cool, but has some issues,
" such as breaking alt bindings (--bind=alt-p:previous-history) and causing
" the cursor to jump to the top of the file if projectionist is enabled.
" https://github.com/junegunn/fzf.vim/issues/1164
let g:fzf_layout = { 'down': '50%' }

command! -bang -nargs=* Ag
\ call fzf#vim#ag(
\   <q-args>,
\   fzf#vim#with_preview(
\     {
\       'options': [
\         '--reverse',
\         '--delimiter', ':',
\         '--nth', '4'
\       ]
\     },
\     s:fzf_preview_window,
\     s:fzf_preview_toggle
\   ),
\   <bang>0
\ )

let g:grepper =
\ { 'next_tool': '<Bslash><Bslash>' }

augroup CoherentSearch
  autocmd!
  autocmd User Grepper call hint#prepare_highlights()
  autocmd User Hint,listical_next,listical_prev Latitude
augroup END
