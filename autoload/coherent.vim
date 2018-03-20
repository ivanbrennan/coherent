if exists("g:autoloaded_coherent") | finish | endif
let g:autoloaded_coherent = 1

fun! coherent#is_search()
  let x = getcmdtype()
  return x == '/' || x == '?'
endf

func! coherent#cmdline_colon()
  return s:cmdline_first_char() ? "\<Up>" : ":"
endf

func! s:cmdline_first_char()
  if getcmdtype() == ':'
    " first column, or first column following "'<,'>" visual range
    return getcmdpos() == 1 || (getcmdpos() == 6 && getcmdline() == "'<,'>")
  else
    return 0
  endif
endf

func! coherent#foldtext()
  let l:text =  '+'
  let l:text .= substitute(v:folddashes, '-', '·', 'g')
  let l:text .= substitute(getline(v:foldstart), '^\S', ' &', '')
  return l:text
endf

func! coherent#synstack()
  return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endf

func! coherent#syntaxhighlights(...)
  let l:stack  = coherent#synstack()
  let l:arg    = a:0 ? a:1 : 0
  let l:offset = max([l:arg, -len(l:stack)])

  exe 'echo expand("<cword>")'
  exe 'echo " "'

  for name in l:stack[l:offset:]
    exe 'verbose hi ' . name
  endfor
endf

func! coherent#nexttextobject(motion)
  echo
  let c = nr2char(getchar())
  execute "normal! f" . c . "v" . a:motion . c
endf

func! coherent#expreffect(side_effect)
  execute a:side_effect
  return ''
endf

func! coherent#reloadbuffers()
  set autoread
  silent! checktime
  set noautoread
  echo 'reloaded!'
endf
