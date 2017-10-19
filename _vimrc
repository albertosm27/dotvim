"Plugins sections vim-plug
call plug#begin('~/vimfiles/plugged')

Plug 'morhetz/gruvbox'

call plug#end()

"Enable true colors
set term=xterm
set termencoding=utf8
set t_Co=256
let &t_AB="\e[48;5;%dm" 
let &t_AF="\e[38;5;%dm"

colorscheme gruvbox " color scheme

"Fix Bac  sdadakjikas  
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
set backspace=2

"Cursor fix
let &t_ti.="\<Esc>[1 q"
let &t_SI.="\<Esc>[5 q"
let &t_EI.="\<Esc>[1 q"
let &t_te.="\<Esc>[0 q"

set number " show line numbers
set relativenumber " show relative line numbers

syntax enable " enable syntax processing

set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces

set showcmd " show command in bottom bar

set cursorline " highlight current line

set showmatch " highlight matching [{()}]

set incsearch " search as characters are entered
set hlsearch " highlight matches

set lazyredraw  " redraw when needed 

"Folds
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold method based on indent level
