
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
  syntax on
endif

if 1
  filetype plugin indent on
endif

if has('reltime')
  set incsearch
endif

map Q gq
set mouse=a
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

if has('langmap') && exists('+langremap')
  set nolangremap
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
" if has('syntax') && has('eval')
"   packadd! matchit
" endif

set title
set wildmenu

set backspace=indent,eol,start
set history=200
set ruler
set tabstop=4 shiftwidth=4 expandtab
set ignorecase                      " ignore case on search
set smartcase                       " Uppercase forces Case Search
set number
set showcmd
set display=truncate
set scrolloff=5
set foldmethod=indent
set foldlevel=99
set clipboard^=unnamed
nnoremap <space> za

call plug#begin()

" Linter
Plug 'dense-analysis/ale'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'

" Smart search
Plug 'ctrlpvim/ctrlp.vim'

" Themes
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

call plug#end()

" ALE configs
let g:ale_lint_on_text_changed = 'never'

" Themes
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif
