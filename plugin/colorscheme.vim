if exists("g:loaded_coherent_colorscheme") | finish | endif
let g:loaded_coherent_colorscheme = 1

if has('termguicolors')
  set termguicolors
endif

" Watch for https://github.com/vim/vim/commit/f59c6e8cee092433d325ba21a107654a8d84f776
" When it makes it into neovim, there may be a better way to configure this.
if has('nvim')
  " Normal colors
  let g:terminal_color_0 = '#242e38' " black
  let g:terminal_color_1 = '#de4d3a' " red
  let g:terminal_color_2 = '#b8e068' " green
  let g:terminal_color_3 = '#ebcb8b' " yellow
  let g:terminal_color_4 = '#a1b3c9' " blue
  let g:terminal_color_5 = '#617fa0' " magenta
  let g:terminal_color_6 = '#69d2e7' " cyan
  let g:terminal_color_7 = '#ffffff' " white
  " Bright colors
  let g:terminal_color_8  = '#303d4b' " black
  let g:terminal_color_9  = '#f4718c' " red
  let g:terminal_color_10 = '#d8e778' " green
  let g:terminal_color_11 = '#f7c352' " yellow
  let g:terminal_color_12 = '#a8d0e0' " blue
  let g:terminal_color_13 = '#53769d' " magenta
  let g:terminal_color_14 = '#26a6a6' " cyan
  let g:terminal_color_15 = '#ffffff' " white
else
  let g:terminal_ansi_colors = repeat([0], 16)
  " Normal colors
  let g:terminal_ansi_colors[0] = '#242e38' " black
  let g:terminal_ansi_colors[1] = '#de4d3a' " red
  let g:terminal_ansi_colors[2] = '#b8e068' " green
  let g:terminal_ansi_colors[3] = '#ebcb8b' " yellow
  let g:terminal_ansi_colors[4] = '#a1b3c9' " blue
  let g:terminal_ansi_colors[5] = '#617fa0' " magenta
  let g:terminal_ansi_colors[6] = '#69d2e7' " cyan
  let g:terminal_ansi_colors[7] = '#ffffff' " white
  " Bright colors
  let g:terminal_ansi_colors[8]  = '#303d4b' " black
  let g:terminal_ansi_colors[9]  = '#f4718c' " red
  let g:terminal_ansi_colors[10] = '#d8e778' " green
  let g:terminal_ansi_colors[11] = '#f7c352' " yellow
  let g:terminal_ansi_colors[12] = '#a8d0e0' " blue
  let g:terminal_ansi_colors[13] = '#53769d' " magenta
  let g:terminal_ansi_colors[14] = '#26a6a6' " cyan
  let g:terminal_ansi_colors[15] = '#ffffff' " white
endif


if !exists('g:colors_name')
  if $THEME == 'light'
    colorscheme blight
  else
    colorscheme wool
  endif
endif
