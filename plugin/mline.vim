if exists("g:loaded_coherent_mline") | finish | endif
let g:loaded_coherent_mline = 1

" Since mline#branch() depends on fugitive and Vim doesn't provide control
" over the load order of packages/plugins under the same packpath entry, wrap
" this initialization in a function that can be called at the end of the
" initialization process.
func! s:init()
  setg statusline=\                            " space

  setg statusline+=%1*                         " User1 highlight group (filename)
  setg statusline+=%{mline#bufname()}          " relative path
  setg statusline+=%*                          " reset highlight group
  setg statusline+=%{mline#bufname_nc()}       " relative path (non-current)
  setg statusline+=\                           " space

  setg statusline+=%#StatusLineNC#             " StatusLineNC highlight group
  setg statusline+=%{mline#before_filetype()}  " dimmed '['
  setg statusline+=%2*                         " User2 highlight group (filetype)
  setg statusline+=%{mline#filetype()}         " filetype (current)
  setg statusline+=%*                          " reset highlight group
  setg statusline+=%{mline#filetype_nc()}      " filetype (non-current)
  setg statusline+=%#StatusLineNC#             " StatusLineNC highlight group
  setg statusline+=%{mline#after_filetype()}   " dimmed ']'
  setg statusline+=%*                          " reset highlight group
  setg statusline+=\                           " space

  setg statusline+=%w                          " preview
  setg statusline+=%M                          " modified

  setg statusline+=%=                          " separator

  setg statusline+=\                           " space
  setg statusline+=%{toupper(&fenc)}           " encoding

  if exists('g:loaded_fugitive')
    setg statusline+=%(\ \ %{mline#branch()}%) " branch
  endif

  setg statusline+=\ \                         " spaces

  setg statusline+=%l:                         " line:
  setg statusline+=%#StatusLineNC#             " dim
  setg statusline+=%v                          " column
  setg statusline+=%*                          " reset highlight group
  setg statusline+=\                           " space
endf

if v:vim_did_enter
  let g:mline_trace = 'if'
  call s:init()
else
  let g:mline_trace = 'else'
  augroup Mline
    autocmd!
    autocmd VimEnter * call s:init()
  augroup END
endif
