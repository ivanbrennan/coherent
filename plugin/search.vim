if exists("g:loaded_coherent_search") | finish | endif
let g:loaded_coherent_search = 1

let g:fzf_colors =
\ { 'prompt':  ['fg', 'LineNr'] }

let g:fzf_files_options = substitute($FZF_CTRL_T_OPTS, '\n *', ' ', 'g')

let s:fzf_text_search_options = '--reverse --delimiter="\d:" --nth=3..'

let s:fzf_rg_cmd = 'rg --column --line-number --no-heading --color=always '

" Default options passed to ag: --nogroup --column --color
" Further options can be passed to fzf#vim#ag() as a second argument, e.g.
"   fzf#vim#ag(<q-args>, '--nocolor', <bang>0 ? ... : ..., <bang>0)

command! -bang -nargs=* Ag
\ call fzf#vim#ag(
\   <q-args>,
\   <bang>0 ? s:fzf_preview_large() : s:fzf_preview_small(),
\   <bang>0
\ )

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   s:fzf_rg_cmd.shellescape(<q-args>), 1,
\   <bang>0 ? s:fzf_preview_large() : s:fzf_preview_small(),
\   <bang>0
\ )

func! s:fzf_preview_large()
  return fzf#vim#with_preview(
  \ {'options': s:fzf_text_search_options},
  \ 'up:60%')
endf

func! s:fzf_preview_small()
  return fzf#vim#with_preview(
  \ {'options': s:fzf_text_search_options},
  \ 'right:50%:hidden',
  \ '?')
endf

let g:grepper =
\ { 'next_tool': '<Bslash><Bslash>' }

augroup CoherentSearch
  autocmd!
  autocmd User Grepper call hint#prepare_highlights()
  autocmd User Hint,listical_next,listical_prev Latitude
augroup END
