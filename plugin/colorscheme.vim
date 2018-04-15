if exists("g:loaded_coherent_colorscheme") | finish | endif
let g:loaded_coherent_colorscheme = 1

if has('termguicolors')
  set termguicolors
endif

" Watch for https://github.com/vim/vim/commit/f59c6e8cee092433d325ba21a107654a8d84f776
" When it makes it into neovim, there may be a better way to configure this.
if has('nvim')
  " Normal colors
  let g:terminal_color_0  = '#181818' " black
  let g:terminal_color_1  = '#de4d3a' " red
  let g:terminal_color_2  = '#b8e068' " green
  let g:terminal_color_3  = '#ebcb8b' " yellow
  let g:terminal_color_4  = '#61b3c9' " blue
  let g:terminal_color_5  = '#617fa0' " magenta
  let g:terminal_color_6  = '#69d2e7' " cyan
  let g:terminal_color_7  = '#d5d8dc' " white
  " Bright colors
  let g:terminal_color_8  = '#303d4b' " black
  let g:terminal_color_9  = '#f4718c' " red
  let g:terminal_color_10 = '#d8e778' " green
  let g:terminal_color_11 = '#f8bb39' " yellow
  let g:terminal_color_12 = '#a1b3c9' " blue
  let g:terminal_color_13 = '#53769d' " magenta
  let g:terminal_color_14 = '#26a6a6' " cyan
  let g:terminal_color_15 = '#ffffff' " white
endif

if !exists('g:colors_name')
  if $THEME == 'light'
    colorscheme blight
  else
    colorscheme moot
  endif
endif
