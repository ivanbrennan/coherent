if exists("g:autoloaded_coherent") | finish | endif
let g:autoloaded_coherent = 1

func! coherent#offset() abort
  let offset = min([6, winheight(0)/2])

  let bot_want = min([offset, line('$') - line('.')])
  let bot_have = winheight(0) - winline()
  if bot_want > bot_have
    exec 'normal!' (bot_want - bot_have) . "\<C-E>"
  else
    let top_want = min([offset, line('.') - 1])
    let top_have = winline() - 1
    if top_want > top_have
      exec 'normal!' (top_want - top_have) . "\<C-Y>"
    endif
  endif
endf

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
