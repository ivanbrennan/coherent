if exists("g:autoloaded_coherent") | finish | endif
let g:autoloaded_coherent = 1

" map-expr helpers

func! coherent#expreffect(side_effect)
  exec a:side_effect
  return ''
endf

func! coherent#nexttextobject(motion)
  echo
  let c = nr2char(getchar())
  exec "normal! f" . c . "v" . a:motion . c
endf

func! coherent#foldtext()
  let l:text =  '+'
  let l:text .= substitute(v:folddashes, '-', '·', 'g')
  let l:text .= substitute(getline(v:foldstart), '^\S', ' &', '')
  return l:text
endf

func! coherent#reloadbuffers()
  set autoread
  silent! checktime
  set noautoread
  echo 'reloaded!'
endf
