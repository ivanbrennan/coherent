if exists("g:autoloaded_coherent_mline") || &cp
  finish
endif
let g:autoloaded_coherent_mline = 1

func! mline#current() abort
  return exists('g:actual_curbuf') && bufnr('%') == g:actual_curbuf
endf

func! mline#bufname() abort
  return mline#current() ? bufname('%') : ''
endf
func! mline#bufname_nc() abort
  return !mline#current() ? bufname('%') : ''
endf

func! mline#filetype() abort
  return mline#current() ? &filetype : ''
endf
func! mline#filetype_nc() abort
  return !mline#current() ? &filetype : ''
endf

func! mline#before_filetype() abort
  return strlen(&filetype) ? '[' : ''
endf
func! mline#after_filetype() abort
  return strlen(&filetype) ? ']' : ''
endf

func! mline#branch() abort
  let l:branch = fugitive#head()
  if empty(branch)
    return ''
  else
    return '(' . l:branch . ')'
  endif
endf

let s:highlight_modified = 0

func! mline#check_modified() abort
  if &modified && !s:highlight_modified
    let s:highlight_modified = 1
    call mline#update_highlight()
  elseif !&modified && s:highlight_modified
    let s:highlight_modified = 0
    call mline#update_highlight()
  endif
endf

func! mline#update_highlight() abort
  let l:bg = pinnacle#extract_bg('StatusLine')
  let l:fg = pinnacle#extract_fg('StatusLine')
  let l:colors = filter({'bg': l:bg, 'fg': l:fg}, 'v:val != ""')

  if &modified
    let l:name_style = 'bold,italic'
    let l:type_style = 'italic'
  else
    let l:name_style = 'bold'
    let l:type_style = 'NONE'
  endif

  " StatusLine + name_style
  call s:highlight('User1', l:colors, l:name_style)

  " StatusLine + type_style
  call s:highlight('User2', l:colors, l:type_style)

  " StatusLine + unconditional italics
  call s:highlight('User3', l:colors, 'italic')
endf

func! s:highlight(group, colors, style) abort
  let l:dict = extend(a:colors, {'term': a:style})
  let l:spec = s:spec(l:dict)

  execute 'highlight!' a:group l:spec
endf

let s:prefix=has('gui') || has('termguicolors') ? 'gui' : 'cterm'

function! s:spec(highlight) abort
  let l:result=[]
  if has_key(a:highlight, 'bg')
    call insert(l:result, s:prefix . 'bg=' . a:highlight['bg'])
  endif
  if has_key(a:highlight, 'fg')
    call insert(l:result, s:prefix . 'fg=' . a:highlight['fg'])
  endif
  if has_key(a:highlight, 'term')
    call insert(l:result, 'gui='   . a:highlight['term'])
    call insert(l:result, 'cterm=' . a:highlight['term'])
  endif
  return join(l:result, ' ')
endfunction
