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

" cmdline
noremap  <leader>x      :
nnoremap <leader>1      :!
nnoremap <leader>h      :help 
nnoremap <leader><C-H>  :help <C-R><C-W>

cnoremap <C-A>          <Home>
cnoremap <C-X><C-A>     <C-A>
cnoremap <C-B>          <Left>
cnoremap <C-F>          <Right>
cnoremap <C-X><C-F>     <C-F>
cnoremap <C-@>          <lt>leader>
cnoremap <C-Space>      <lt>leader>

cnoremap <expr> <C-D>   getcmdpos() > strlen(getcmdline()) ? "\<C-D>" : "\<Del>"
cnoremap <expr> :       coherent#cmdline_colon()

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

" touch of emacs
inoremap <C-A>       <Home>
inoremap <C-X><C-A>  <C-A>
inoremap <C-B>       <C-G>U<Left>
inoremap <C-F>       <C-G>U<Right>
inoremap JK          <End>
inoremap <C-D>       <Del>
imap     <C-T>       <Plug>(vmacs_transpose_i)
cmap     <C-T>       <Plug>(vmacs_transpose_c)
imap     <C-A>       <Plug>(vmacs_start_of_line)

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

cnoremap <expr> <M-r> coherent#is_search() ? "\<C-R>" : "\<M-r>"
cnoremap <expr> <C-R> coherent#is_search() ? "\<C-T>" : "\<C-R>"
cnoremap <expr> <C-S> coherent#is_search() ? "\<C-G>" : "\<C-S>"
cnoremap <expr> <C-Y> coherent#is_search() ? "\<C-L>" : "\<C-Y>"
cnoremap        <C-P> <Up>
cnoremap        <C-N> <Down>

" :nohlsearch
nnoremap <silent> <M-U> :nohlsearch<CR>
nnoremap coh :<C-R>=eval(&hls) ? (v:hlsearch ? 'noh' : 'set nohls') : 'set hls'<CR><CR>

" inspect syntax
nmap     <leader>3   <Plug>(sohi_light)
nmap     <leader>#   <Plug>(sohi_lights)

" substitute
nnoremap <leader>S   :%s/
nnoremap <leader>s   :s/
vnoremap <leader>s   :s/
nnoremap c.          *Ncgn

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
