if exists("g:autoloaded_coherent") | finish | endif
let g:autoloaded_coherent = 1

" map-expr helpers

fun! coherent#is_search()
  let x = getcmdtype()
  return x == '/' || x == '?'
endf

func! coherent#cmdline_up_or(key)
  return s:cmdline_first_char() ? "\<Up>" : a:key
endf

func! s:cmdline_first_char()
  if getcmdtype() == ':'
    " first column, or first column following "'<,'>" visual range
    return getcmdpos() == 1 || (getcmdpos() == 6 && getcmdline() == "'<,'>")
  else
    return 0
  endif
endf

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
