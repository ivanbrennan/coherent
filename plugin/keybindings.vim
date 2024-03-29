if exists("g:loaded_coherent_keybindings") | finish | endif
let g:loaded_coherent_keybindings = 1

" Equivalent to 'let mapleader=" "' but prevents
" mappings from breaking after a timeout.
map <Space> <Leader>

" Timeout mappings and key codes
set timeout timeoutlen=1000 ttimeoutlen=5

" source / edit vimrc
nmap     <leader>vv     <Plug>(edot_source) 
nmap     <leader>vo     <Plug>(edot_edit) 

" buffers / files
nnoremap <leader>o      :edit <C-R>=empty(expand('%')) ? '' : expand('%:~:.:h').'/'<CR>
nnoremap <leader>e      :edit 
nnoremap <leader><C-E>  :edit **/
nnoremap <leader>fs     :write<CR>
nnoremap <leader>wq     :wq 
nnoremap <leader>dd     :bdelete<CR>
nnoremap <leader>dl     :bdelete#<CR>
nnoremap <leader>l      <C-^>
nmap     <leader>u      <Plug>(dirvish_up)
nnoremap <leader>F :setf 

" quickfix/loclist
nmap     <leader><Space> <Plug>(listical_toggle)
nmap     <M-n>           <Plug>(listical_next)<Plug>
nmap     <M-N>           <Plug>(listical_next_file)<Plug>
nmap     <M-p>           <Plug>(listical_previous)<Plug>
nmap     <M-P>           <Plug>(listical_previous_file)<Plug>
nmap     <M-h>           <Plug>(listical_older)
nmap     <M-l>           <Plug>(listical_newer)

" alternates
nnoremap <leader><Tab>  :A<CR>

" precise jump to mark
nnoremap <M-'>  `
" free up semicolon for cmdline
noremap '       ;

" cmdline
noremap  ;              :
noremap  <leader>x      :
nnoremap <leader>1      :!
nnoremap <leader>h      :help 
nnoremap <leader><C-H>  :help <C-R><C-W>

cmap     ;              <Plug>(refract_semicolon_recall)
cmap     s              <Plug>(refract_autoreturn_ls_vs)

" add blank line above / below
nnoremap <silent> <S-CR>    :call append(line('.') - 1, '')<CR>
nnoremap <silent> <C-CR>    :call append(line('.'), '')<CR>
nnoremap <silent> <M-CR>    :call append(line('.'), '')<CR>

" bubble up / down
nnoremap <silent> <C-Up>    mZ:silent! move .-2<CR>==`Z
vnoremap <silent> <C-Up>    :<C-U>silent! '<,'>move '<-2<CR>gv=gv
inoremap <silent> <C-Up>    <Esc>:silent! move .-2<CR>==gi
nnoremap <silent> <C-Down>  mZ:silent! move .+1<CR>==`Z
vnoremap <silent> <C-Down>  :<C-U>silent! '<,'>move '>+1<CR>gv=gv
inoremap <silent> <C-Down>  <Esc>:silent! move .+1<CR>==gi

" spawn newline
inoremap <S-CR> <C-O>O
inoremap <C-CR> <C-O>o
inoremap <M-CR> <C-O>o

" sensible Y
nnoremap Y      y$

" the abyss
vnoremap <BS>   "_d

" start new undo-group for <C-U>
inoremap <C-U>       <C-G>u<C-U>

" touch of Less & Emacs
inoremap <M-h>       <Left>
cnoremap <M-h>       <Left>
inoremap <M-l>       <Right>
cnoremap <M-l>       <Right>

inoremap <M-b>       <C-O>b
cnoremap <M-b>       <C-Left>
inoremap <M-w>       <C-O>w
cnoremap <M-w>       <C-Right>
cnoremap <M-f>       <C-Right>

imap     <M-a>       <Plug>(vmacs_start_of_line)
nmap     <M-a>       <Plug>(vmacs_start_of_line)
xmap     <M-a>       <Plug>(vmacs_start_of_line)
imap     <C-A>       <Plug>(vmacs_start_of_line)
inoremap <C-X><C-A>  <C-A>
cnoremap <C-A>       <Home>
cnoremap <C-X><C-A>  <C-A>
cnoremap <M-a>       <Home>
noremap  <M-e>       <End>
noremap! <M-e>       <End>
cnoremap <C-B>       <Left>
cnoremap <C-F>       <Right>
exe      "set cedit=\<C-O>"

imap     <C-t>       <Plug>(vmacs_transpose_i)
cmap     <C-t>       <Plug>(vmacs_transpose_c)
inoremap <C-D>       <Del>
cmap     <C-D>       <Plug>(refract_delete)

" indent/dedent/re-indent
inoremap <M-t>       <C-T>
inoremap <M-d>       <C-D>
inoremap <M-f>       <C-F>

" + -
nnoremap +           <C-A>
xnoremap +           <C-A>
nnoremap -           <C-X>
xnoremap -           <C-X>

" commentary
xmap     <leader>;   <Plug>Commentary
nmap     <leader>;   <Plug>Commentary
omap     <leader>;   <Plug>Commentary
nmap     <leader>;;  <Plug>CommentaryLine
xmap     <M-;>       <Plug>Commentary
nmap     <M-;>       <Plug>Commentary
omap     <M-;>       <Plug>Commentary
nmap     <M-;><M-;>  <Plug>CommentaryLine

" EasyAlign
nmap     ga          <Plug>(EasyAlign)
xmap     ga          <Plug>(EasyAlign)
nnoremap gA          ga
xnoremap gA          ga

" tag, pop
nmap     <C-.>       <Plug>(ArticulateTag)
xmap     <C-.>       <Plug>(ArticulateTag)
nmap     <C-,>       <Plug>(ArticulatePop)
xmap     <C-,>       <Plug>(ArticulatePop)
nmap     g.          <Plug>(ArticulateTjump)
xmap     g.          <Plug>(ArticulateTjump)
nmap     g:          :tjump 
nmap     g<Space>    :tjump 

" fzf / ag
nnoremap <silent> <M-o>         :Files<CR>
nnoremap <silent> <leader>fo    :Files<CR>
nnoremap <silent> <leader>/     :Ag<CR>
nnoremap <silent> <leader>.     :Grepper<CR>
nnoremap <silent> <leader>b     :Buffers<CR>
nnoremap <silent> <leader>fh    :History/<CR>
nnoremap <silent> <leader>fg    :Tags<CR>
nnoremap <silent> <M-H>         :Helptags<CR>
cnoremap <expr>     :   refract#if_cmd_match(['^$'], "Commands\<CR>", ':')
cnoremap <expr>   <C-R> refract#if_cmd_match(['^$'], "History:\<CR>", "\<C-R>")

" terminal keys
tnoremap <C-w>; <C-w>:

" terminal-special-keys
func! SendToTerm(keys)
  call term_sendkeys('', a:keys)
  return ''
endf
tnoremap <expr> <M-b> SendToTerm("\<Esc>b")
tnoremap <expr> <M-d> SendToTerm("\<Esc>d")
tnoremap <expr> <M-f> SendToTerm("\<Esc>f")
tnoremap <expr> <M-n> SendToTerm("\<Esc>n")
tnoremap <expr> <M-p> SendToTerm("\<Esc>p")
tnoremap <expr> <M-t> SendToTerm("\<Esc>t")

" shell
nmap     <leader>i   <C-Z>
if executable("xsel")
  func! PreserveClipboard()
    call system("xsel --input --clipboard", getreg("+"))
  endf

  func! PreserveClipboadAndSuspend()
    call PreserveClipboard()
    suspend
  endf

  autocmd VimLeave * call PreserveClipboard()
  nnoremap <silent> <C-Z> :call PreserveClipboadAndSuspend()<CR>
endif

" autocompletion
inoremap <C-F>       <C-X><C-F>
inoremap <C-L>       <C-X><C-L>
inoremap <C-]>       <C-X><C-]>

" indentation
vnoremap <Tab>  =
vnoremap <      <gv
vnoremap >      >gv

" emacs
inoremap <C-S>       <C-O>/
inoremap <C-R>       <C-O>?
inoremap <M-r>       <C-R>
nnoremap U           <C-R>
nnoremap <C-X><C-U>  U
nnoremap <C-X>u      U

cmap            <C-P> <Plug>(refract_incsearch_prev)
cmap            <C-N> <Plug>(refract_incsearch_next)
cnoremap <expr> <C-Y> refract#if_incsearch("\<C-L>", "\<C-Y>")
cnoremap        <M-p> <Up>
cnoremap        <M-n> <Down>
cnoremap        <M-r> <C-R>

" inspect syntax
nmap     <leader>3   <Plug>(sohi_light)
nmap     <leader>#   <Plug>(sohi_lights)

" substitute
nnoremap <M-s>       :%s/
nnoremap <leader>s   :s/
vnoremap <leader>s   :s/

" replace word under cursor
nnoremap c.     Mmz<C-O>*N`zzz<C-O>cgn

" spell
noremap  z<CR>  1z=
nmap     zy     <Plug>(optcycle_spell+)

" preserve flags
nnoremap &      :&&<CR>
xnoremap &      :&&<CR>

" first non-blank on next/previous line
nnoremap <C-N>  +
nnoremap <C-P>  -

" scroll
noremap <C-J>   <C-E>
noremap <C-K>   <C-Y>
noremap <C-E>   $
noremap <C-A>   0

" splits
nnoremap <C-D>      <C-W><C-Q>
noremap  <leader>,  <C-W>w
noremap  <C-W><C-Y> <C-W>z

" zoom
nmap     <C-W>.        <Plug>(zoo)
nnoremap <C-W><Bslash> <C-W><Bar>

" tabs
noremap <C-W><C-N> gt
noremap <C-W><C-P> gT

" folding
nnoremap z.  za

" recenter / redraw
nnoremap <C-L>         zz
nnoremap <C-U><C-L>    zt
nnoremap <leader><C-L> <C-L>

" git
noremap <silent> gb :Git blame<CR>
noremap <silent> gs :Git<CR>

" hint
nnoremap <M-u> <Plug>(hint_toggle_highlight)

" safe <CR> for use in nmap's
nnoremap <Plug>(coherent_enter) <CR>
