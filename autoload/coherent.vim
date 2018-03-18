if exists("g:autoloaded_coherent") | finish | endif
let g:autoloaded_coherent = 1

fun! coherent#is_search()
  let x = getcmdtype()
  return x == '/' || x == '?'
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

func! coherent#complete_or_indent(int)
  " complete if popup-menu displayed
  if pumvisible() | return s:complete() | endif

  let line = getline('.')  " current line
  let col  = col('.') - 1  " current 0-indexed column

  if a:int > 0 && (!s:finishing_word(line, col) || s:want_tab())
    return s:indent()
  endif

  " non-whitespace characters before cursor
  let prefix = expand(matchstr(line[0:col-1], '\S*$'), 1)

  " complete filename if finishing a path
  if prefix =~ '^[~/.]' | return "\<C-X>\<C-F>" | endif

  " perform custom completion if possible
  if !empty(&completefunc) && call(&completefunc, [1, prefix]) >= 0
    return "\<C-X>\<C-U>"
  endif

  return s:complete(a:int)
endf

func! s:finishing_word(line, col)
  " preceded by word/filename char AND NOT inside word
  return a:line[a:col-1] =~ '\k\|[/~.]' && a:line[a:col] !~ '\k'
endf

func! s:want_tab()
  " this needs to be smarter
  return ! &expandtab
endf

func! s:complete(int)
  return a:int > 0 ? "\<C-N>" : "\<C-P>"
endf

func! s:indent()
  return (!empty(&indentexpr) || &cindent) ? "\<C-F>" : "\<Tab>"
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
