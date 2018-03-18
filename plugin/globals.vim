if exists("g:loaded_coherent_globals") | finish | endif
let g:loaded_coherent_globals = 1

let g:is_bash=1             " sh is bash
let g:sh_fold_enabled=1     " fold sh functions
let g:vimsyn_folding = "f"  " fold vim functions
let g:vimsyn_noerror = 1    " vim.vim sometimes gets it wrong
let g:fugitive_no_maps = 1  " leave me free to remap <C-R>

" use dirvish instead of netrw
let g:loaded_netrwPlugin = 1

" Netrw & Vinegar
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_hide=1              " hide hidden files
let g:netrw_dirhistmax=100      " keep more history
let g:netrw_altfile=1           " last edited file '#'
let g:netrw_liststyle=0         " thin
let g:netrw_alto=0              " open files on right
let g:netrw_winsize=20          " preview winsize
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window

let g:optcycle_config = {
\   'colorscheme': [
\     { 'colorscheme': 'root' },
\     { 'colorscheme': 'moot' },
\     { 'colorscheme': 'ion' },
\     { 'colorscheme': 'blight' }
\   ]
\ }

let g:projectionist_heuristics = {
\   '*': {
\     '*.c': {
\       'alternate': '{}.h',
\       'type': 'source'
\     },
\     '*.h': {
\       'alternate': '{}.c',
\       'type': 'header'
\     }
\   }
\ }

let g:dirvish_mode = ':sort r /[^\/]$/'

let g:LoupeCenterResults = 0
let g:LoupeHlSearchTimeout = 1000
let g:LoupeVeryMagic = 0
