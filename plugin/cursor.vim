if exists("g:loaded_coherent_cursor") || &cp
  finish
endif
let g:loaded_coherent_cursor = 1

set cursorline

" cursor shape
if has("nvim")
  " it all just works!
elseif exists("$ITERM_PROFILE")
  if &term =~ 'xterm'
    " iTerm
    let &t_SI="\<Esc>[1337;CursorShape=1\x7"
    let &t_SR="\<Esc>[1337;CursorShape=2\x7"
    let &t_EI="\<Esc>[1337;CursorShape=0\x7"
  elseif &term =~ 'tmux\|screen' && exists("$TMUX")
    " iTerm multiplexed
    let &t_SI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  endif
elseif &term =~ 'xterm'
  " Linux
  let &t_SI="\<Esc>[6 q"
  let &t_SR="\<Esc>[4 q"
  let &t_EI="\<Esc>[0 q"
endif

" gui
set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0
