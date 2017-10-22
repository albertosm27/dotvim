"My vimrc for Windows Cmder, Alberto Sabater Morales

"Plugins vim-plug {{{
call plug#begin('~/vimfiles/plugged')

Plug 'morhetz/gruvbox'

call plug#end()
"}}}

"ConEmu fixes {{{
"Enable true colors
set term=xterm
set termencoding=utf8
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

"Fix Backsapce
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

"Cursor fix
let &t_ti.="\<Esc>[1 q"
let &t_SI.="\<Esc>[5 q"
let &t_EI.="\<Esc>[1 q"
let &t_te.="\<Esc>[0 q"
"}}}

"Color {{{
colorscheme gruvbox " color scheme
"}}}

"UI Layout {{{
set number " show line numbers
set relativenumber " show relative line numbers
set cursorline " highlight current line
set showmatch " highlight matching [{()}]
"}}}

"Tabs, spaces {{{
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
"}}}

"Syntax {{{
syntax enable " enable syntax processing
"}}}

"Search {{{
set incsearch " search as characters are entered
set hlsearch " highlight matches
"}}}

"Folding {{{
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold method based on indent level
"}}}

"Misc {{{
set backspace=2
set showcmd " show command in bottom bar
set lazyredraw  " redraw when needed
"Higlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"Remove trailing whitespaces based on filetype
nnoremap <F5> :%s/\s\+$//e <CR>
"}}}

"Leader shortcuts {{{
let leader=","
"}}}

" vim:foldmethod=marker:foldlevel=0
