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
nnoremap <leader>bn     :bnext<CR>
nnoremap <leader>bp     :bprevious<CR>
nnoremap <leader>l      <C-^>
nmap     <leader>u      <Plug>(dirvish_up)

" quickfix/loclist
nmap     <C-@>          <Plug>(listical_toggle)
nmap     <C-Space>      <Plug>(listical_toggle)
nmap     <M-n>          <Plug>(listical_next)
nmap     <M-p>          <Plug>(listical_previous)
nmap     <M-h>          <Plug>(listical_older)
nmap     <M-l>          <Plug>(listical_newer)

" precise jump to mark
nnoremap <M-'>  `
" free up semicolon for cmdline
nnoremap '      ;

" cmdline
noremap  ;              :
noremap  <leader>x      :
nnoremap <leader>1      :!
nnoremap <leader>h      :help 
nnoremap <leader><C-H>  :help <C-R><C-W>

cnoremap <expr> :       coherent#cmdline#if_cmd_start_maybe_visual("\<Up>", ':')
cnoremap <expr> ;       coherent#cmdline#if_cmd_start_maybe_visual("\<Up>", ';')

cnoremap <expr> ls      coherent#cmdline#if_cmd_start("ls\<CR>", 'ls')
cnoremap <expr> vs      coherent#cmdline#if_cmd_start("vs\<CR>", 'vs')
cnoremap <expr> sp      coherent#cmdline#if_cmd_start("sp\<CR>", 'sp')

cnoremap <C-@>          <lt>leader>
cnoremap <C-Space>      <lt>leader>

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

imap     <M-a>       <Plug>(vmacs_start_of_line)
nmap     <M-a>       <Plug>(vmacs_start_of_line)
xmap     <M-a>       <Plug>(vmacs_start_of_line)
cnoremap <M-a>       <Home>
noremap  <M-e>       <End>
noremap! <M-e>       <End>

imap     <C-t>       <Plug>(vmacs_transpose_i)
cmap     <C-t>       <Plug>(vmacs_transpose_c)
inoremap <C-D>       <Del>
cnoremap <expr> <C-D> getcmdpos() > strlen(getcmdline()) ? "\<C-D>" : "\<Del>"

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
nmap     <M-.>       <Plug>(ArticulateTag)
xmap     <M-.>       <Plug>(ArticulateTag)
nmap     <M-,>       <Plug>(ArticulatePop)
xmap     <M-,>       <Plug>(ArticulatePop)
nmap     g.          <Plug>(ArticulateTjump)
xmap     g.          <Plug>(ArticulateTjump)

" shell
nnoremap <leader>i   <C-Z>

" autocompletion
inoremap <C-L>       <C-X><C-L>
inoremap <C-]>       <C-X><C-]>
inoremap <C-@>       <C-X><C-O>
inoremap <C-Space>   <C-X><C-O>

" indentation
vnoremap <Tab>  =
vnoremap <      <gv
vnoremap >      >gv

" emacs
inoremap <C-S>       <C-O>/
nnoremap U           <C-R>
nnoremap <C-X><C-U>  U
nnoremap <C-X>u      U

cnoremap <expr> <C-P> coherent#cmdline#if_search("\<C-T>", "\<Up>")
cnoremap <expr> <C-N> coherent#cmdline#if_search("\<C-G>", "\<Down>")
cnoremap <expr> <C-Y> coherent#cmdline#if_search("\<C-L>", "\<C-Y>")
cnoremap        <M-p> <Up>
cnoremap        <M-n> <Down>

" inspect syntax
nmap     <leader>3   <Plug>(sohi_light)
nmap     <leader>#   <Plug>(sohi_lights)

" substitute
nnoremap <M-s>       :%s/
nnoremap <leader>s   :s/
vnoremap <leader>s   :s/

" replace word under cursor
nnoremap c.     Mmz<C-O>*N`zzz<C-O>cgn

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
noremap <silent> gb :Gblame<CR>
noremap <silent> gs :Gstatus<CR>
