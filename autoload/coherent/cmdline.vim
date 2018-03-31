if exists("g:autoloaded_coherent_cmdline") | finish | endif
let g:autoloaded_coherent_cmdline = 1

fun! coherent#cmdline#if_search(x, y)
  return s:is_search() ? a:x : a:y
endf

func! coherent#cmdline#if_cmd_start(x, y)
  return s:at_cmd_start() ? a:x : a:y
endf

func! coherent#cmdline#if_cmd_start_maybe_visual(x, y)
  return s:at_cmd_start_maybe_visual() ? a:x : a:y
endf

fun! s:is_search()
  let c = getcmdtype()
  return c == '/' || c == '?'
endf

func! s:at_cmd_start()
  return getcmdtype() == ':' && getcmdpos() == 1
endf

func! s:at_cmd_start_maybe_visual()
  if getcmdtype() == ':'
    " first column, or first column following "'<,'>" visual range
    return getcmdpos() == 1 || (getcmdpos() == 6 && getcmdline() == "'<,'>")
  else
    return 0
  endif
endf
