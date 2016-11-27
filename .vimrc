syntax enable
" colorscheme darkblue
colorscheme monokai

filetype plugin indent on

set tabstop=4 "show existing tab with 4 spaces
set shiftwidth=4 " add 4 spaces with '>'
set shiftround
set expandtab
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab
endif

set list
set listchars=tab:>-

set hlsearch " search highlighting
set incsearch " search while typing
set number
set numberwidth=5
set ruler
set relativenumber
" set autoindent " copy indent length from prev line

set scrolljump=1 " srolling offsets
set scrolloff=5
set sidescroll=5
set mouse=a
set winminheight=0 " window size
set winminwidth=0
set laststatus=2 " always view status line 
set showcmd " view current commands
" command line format
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P 
autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=121 " mark 101 column
" set shortmess=+I " hide greeting window

" You can replace all the tabs with spaces in the entire file with
" > :%retab

" ---------- SYSTEM ----------
set history=128
set undolevels=512
set undofile " save undo history to file
set undodir=$VIMDIR/undo/
set nobackup
set noswapfile
" autocmd VimLeavePre * silent mksession ~/.vim/my_session " save session before close
set nocompatible " with vim
set hidden " always keep buffer in memory
set autochdir
set fileencodings=utf-8,cp1251,koi8-r,cp866 " autodetection file types
" set visualbell " disable beeps

set pastetoggle=<F2>
set clipboard=unnamed

let mapleader = ","

" ---------- KEYMAPPING ----------
noremap { {<CR>}<Esc>O<TAB>
"inoremap ( (<Space><Space>)<Esc><Left>i
"inoremap [ [<Space><Space>]<Esc><Left>i
"imap <C-Space> <C-X><C-O>
imap <Ins> <Esc>i

" fast motion
" nmap <C-j> 8j
nmap <C-k> 8k
nmap <C-l> 8l
" nmap <C-;> 8;

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" improved Page Up/Down
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

" save
map <C-s> :w!<cr>
vmap <C-s> <esc>:w!<cr>
imap <C-s> <esc>:w!<cr>

" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" nmap <Space><Space> V
map q: :q
inoremap jj <Esc>

" undo
"nmap <c-z> u
"vmap <c-z> <esc>u
"imap <c-z> <esc>ui

" buffers and tabs
map <Leader>t :tabnew<cr>
nmap <Leader>t :tabnew<cr>
imap <Leader>t <esc>:tabnew<cr>i

map <Leader>p :tabp<cr>
nmap <Leader>p :tabp<cr>
imap <Leader>p <esc>:tabp<cr>i

map <Leader>n :tabn<cr>
nmap <Leader>n :tabn<cr>
imap <Leader>n <esc>:tabn<cr>i

map <Leader>c :tabclose<cr>
nmap <Leader>c :tabclose<cr>
imap <Leader>c <esc>:tabclose<cr>i

"map <C-H> <C-W><Left>
"imap <C-H> <esc><C-W><Left>
"map <C-L> <C-W><Right>
"imap <C-L> <esc><C-W><Right>
"map <C-K> <C-W><Up>
"imap <C-K> <esc><C-W><Up>
"map <C-J> <C-W><Down>
"imap <C-J> <esc><C-W><Down>

" fast search
"nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>
nmap \ /<c-r>=expand("<cword>")<cr> " fast replace ?

map <F3> :mksession! ~/.vim/my_session<cr> " save session
vmap <F3> <esc>:mksession! ~/.vim/my_session<cr>
imap <F3> <esc>:mksession! ~/.vim/my_session<cr>

map <F4> :source ~/.vim/my_session<cr> " open session
vmap <F4> <esc>:source ~/.vim/my_session<cr>
imap <F4> <esc>:source ~/.vim/my_session<cr>

" F5 - make
function Vim_msg_show( )
	let s:vim_msg_state=1
	botright copen
endfunction

map <F5> :make!<cr><cr>:call Vim_msg_show( )<cr>
vmap <F5> <esc>:make!<cr><cr>:call Vim_msg_show( )<cr>
imap <F5> <esc>:make!<cr><cr>:call Vim_msg_show( )<cr>

"map <F9> :Release<cr>
"vmap <F9> <esc>:make!<cr>
"imap <F9> <esc>:make!<cr>

" F11 - Tag List
"map <F11> :TlistToggle<CR>
"imap <F11> <Esc>:TlistToggle<CR>
"vmap <F11> <Esc>:TlistToggle<CR>

" Ctrl+F12  - ctags 
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"vmap <F12> <esc>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"imap <F12> <esc>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" remap to JKL;
noremap ; l
noremap l k
noremap k j
noremap j h
noremap h <Nop>

" enable russian keyboard layout mapping
" so ~/.vimrussianrc

" ----- ----- PLUGINS ----- -----
call plug#begin('~/.vim/plugged')
Plug 'mrtazz/simplenote.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

" https://github.com/mrtazz/simplenote.vim 
source ~/.simplenoterc
let g:SimplenoteSortOrder = "title"

nnoremap <Leader>s :SimplenoteList<Enter>

nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
