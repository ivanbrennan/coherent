if exists("g:loaded_coherent_globals") | finish | endif
let g:loaded_coherent_globals = 1

" truncate git branch name in statusline
let g:mline_branch_maxwidth = 20

" sort directory listings like `ls -l`
let g:dirvish_mode = ':sort ir ,/\.\?\zs[^/]\+/\?$,'

" Netrw & Vinegar
let g:netrw_altfile=1           " last edited file '#'
let g:netrw_alto=0              " open files on right
let g:netrw_dirhistmax=100      " keep more history
let g:netrw_hide=1              " hide hidden files
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle=0         " thin
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window
let g:netrw_winsize=20          " preview winsize

let g:optcycle_config =
\ {
\   'colorscheme': [
\     { 'colorscheme': 'root' },
\     { 'colorscheme': 'wool' },
\     { 'colorscheme': 'moot' },
\     { 'colorscheme': 'ion' },
\     { 'colorscheme': 'blight' }
\   ]
\ }

let g:projectionist_heuristics =
\ {
\   '*': {
\     '*.c': {
\       'alternate': '{}.h',
\       'type': 'source'
\     },
\     '*.h': {
\       'alternate': '{}.c',
\       'type': 'header'
\     }
\   },
\   '*.cabal': {
\     'src/*.hs': {
\       'alternate': 'test/{}Spec.hs',
\       'type': 'source'
\     },
\     'test/*Spec.hs': {
\       'alternate': 'src/{}.hs',
\       'type': 'test'
\     }
\   }
\ }

if has('nvim')
  let g:python_host_prog  = get(g:,  'python_host_prog', '/usr/local/bin/python2')
  let g:python3_host_prog = get(g:, 'python3_host_prog', '/usr/local/bin/python3')
endif

let g:vim_indent_cont = 0

" vim-tmux-runner
let g:VtrOrientation = "v"
let g:VtrPercentage = 25
