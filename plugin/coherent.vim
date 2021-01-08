" Core configuration and plugin orchestration.
" See :help packages for managing interdependent plugins.
if exists("g:loaded_coherent") | finish | endif
let g:loaded_coherent = 1

if &cp " avoid setting this twice
  set nocompatible
endif

syntax enable
set synmaxcol=256

if filewritable($HOME)
  for dir in ['tmp', 'backup', 'undo']
    if !isdirectory($HOME.'/.vim/'.dir)
      call mkdir($HOME.'/.vim/'.dir, "p")
    endif
  endfor
endif

set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo

set history=1000
set hidden

setg tags-=./tags    " don't just look in the current buffer's directory (vim)
setg tags-=./tags;   " don't just look in the current buffer's directory (nvim)
setg tags+=./tags;~  " search for tags recursively upwards until ~

set title
set cursorline
set number
set nowrap
set showtabline=0
set fillchars=vert:│
set foldmethod=syntax
set foldlevelstart=10
set foldtext=coherent#foldtext()
set nofoldenable
set showcmd
set noshowmode
set laststatus=2
set lazyredraw

set incsearch
set ignorecase
set smartcase
set scrolloff=1
set sidescroll=2
set mouse+=a
set guioptions-=L
set guioptions-=r
set nosplitright
set nosplitbelow

set backspace=indent,eol,start
set nojoinspaces
set nrformats=
set complete-=i
set clipboard=unnamedplus  " default to the clipboard register

if exists('+inccommand')
  set inccommand=nosplit   " nvim magic
endif

set showmatch
set matchtime=2

set tabstop=2      " tab is two spaces
set softtabstop=2  " softtab is two spaces
set shiftwidth=2   " autoindent is two spaces
set expandtab      " convert tabs to spaces
set autoindent     " copy indent from current line

set formatoptions-=t          " don't auto-wrap non-commented text
set formatoptions-=o          " don't auto-comment with o or O
set formatoptions+=r          " auto-comment with Enter
silent! set formatoptions+=j  " let J handle comments if supported

augroup Formatting
  autocmd!
  autocmd FileType * execute 'setl formatprg=par\ -w'.(&tw > 0 ? &tw : 90)
augroup END

if exists('&guifont')
  set guifont=Source\ Code\ Pro:h14
endif

set list                   " show invisible characters
set listchars=""           " reset the listchars
set listchars=tab:▸\       " tab
set listchars+=trail:·     " trailing space
set listchars+=extends:»   " continues offscreen
set listchars+=precedes:«  " precedes offscreen

set shortmess+=I
set novisualbell

set wildmode=list:longest,full

set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.sass-cache/*
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*
set wildignore+=*.DS_Store
set wildignore+=GPATH,GRTAGS,GTAGS

set wildignorecase
