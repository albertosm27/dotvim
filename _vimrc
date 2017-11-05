"My vimrc for Windows Cmder, Alberto Sabater Morales

"Plugins vim-plug {{{
call plug#begin('~/vimfiles/plugged')

Plug 'morhetz/gruvbox'
Plug 'mileszs/ack.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'shime/vim-livedown'

call plug#end()

"Ack config to work with ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

nnoremap <C-m> :LivedownToggle<CR>
"}}}

"ConEmu fixes {{{
"Enable true colors
set term=xterm
set termencoding=utf8
set encoding=utf8
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
set laststatus=2
let g:airline_powerline_fonts = 1
"}}}

"Tabs, spaces {{{
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=4 " indent operations with 4 spaces
"}}}

"Syntax {{{
syntax enable " enable syntax processing

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_show_diagnostics_ui = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}

" Autocomplete {{{
" YouCompleteMe General Config
let g:ycm_global_ycm_extra_conf = 'C:\Users\Shurberto\vimfiles\ycm_extra_conf.py'

set complete=.,b,u,],i,d " basic complete with buffers used, includes and tags
set wildmode=longest,list:longest " autocomplete till longest match
set completeopt=menu,preview " preview matches
" }}}

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

"File and window exploration {{{
"Netrw options
let g:netrw_liststyle = 3 " tree style explorer
let g:netrw_browse_split = 3 " open file in new tab
let g:netrw_winsize = 25 " winsize of 20%
let g:netrw_banner = 0 " hide banner
nnoremap <F2> :Sex! <CR> " netrw shortcut

"Split and tab mappings
nnoremap <Tab> <C-W>w " TAB moves to next split
nnoremap <S-Tab> <C-W>p " S-TAB moves to prev split
nnoremap <C-F> <C-W><Bar> " Max the width of current split
nnoremap <C-E> <C-W>= " Normalize split width
nnoremap <Bar> <C-W>v<C-W><Right> " BAR splits vertically
nnoremap <C-Right> <C-W>r " Swap splits
nnoremap <C-Up> <C-W>T " Split to tab
nnoremap <C-Down> :call MoveToPrevTab()<CR>" Tab to split
"}}}

"Misc {{{
set clipboard=unnamed " copy/paste using clipboard as default
set backspace=2 " backspace normal behaviour
set showcmd " show command in bottom bar
"Higlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"Remove trailing whitespaces based on filetype
nnoremap <F5> :%s/\s\+$//e <CR>
"Automatically use unix file format (CR)
autocmd FileType * if &modifiable|setlocal fileformat=unix|endif
"}}}

"Leader shortcuts {{{
let leader=","
"}}}

"My functions {{{
function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    vs
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
"}}}
" vim:foldmethod=marker:foldlevel=0
