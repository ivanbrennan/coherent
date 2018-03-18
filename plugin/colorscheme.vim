if exists("g:loaded_coherent_colorscheme") | finish | endif
let g:loaded_coherent_colorscheme = 1

if has('termguicolors')
  set termguicolors
endif

if !exists('g:colors_name')
  if $THEME == 'light'
    colorscheme blight
  else
    colorscheme moot
  endif
endif
