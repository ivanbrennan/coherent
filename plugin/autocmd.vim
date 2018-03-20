if exists("g:loaded_coherent_autocmd") | finish | endif
let g:loaded_coherent_autocmd = 1

augroup Formatting
  autocmd!
  autocmd FileType * execute 'setl formatprg=par\ -w'.(&tw > 0 ? &tw : 90)
augroup END

augroup GitGroup
  autocmd!
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

augroup Preview
  autocmd!
  autocmd BufWinEnter * if &previewwindow | nnoremap <nowait><buffer> q <C-W>q| endif
augroup END

augroup CursorGroup
  autocmd!
  autocmd BufReadPost * call RestoreCursorPosition()
augroup END

func! RestoreCursorPosition()
  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endf
