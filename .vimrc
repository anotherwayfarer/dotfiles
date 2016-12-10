syntax enable
" colorscheme darkblue
" colorscheme monokai
" colorscheme railscasts
" colorscheme mustang
" colorscheme jellybeans
colorscheme smyck

filetype plugin indent on
runtime macros/matchit.vim " enable if-else match search by pressing %

set softtabstop=4
set tabstop=4 "show existing tab with 4 spaces
set shiftwidth=4 " add 4 spaces with '>'
set shiftround " round multiple of four
set expandtab " <c-v>Tab - for Tab

set list
set listchars=tab:>- " show tabs

set hlsearch " search highlighting
set incsearch " search while typing

set number " left side
set numberwidth=5
set relativenumber

set ruler " bottom line

set scrolljump=1 " srolling offsets
set scrolloff=5
set sidescroll=5

set mouse=a
set winminheight=0 " window size
set winminwidth=0

set laststatus=2 " always view status line
set showcmd " view current commands
set textwidth=100
set comments=sl:/*,mb:\ *,elx:\ */

autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=101  " mark 101 column
highlight ExtraWhitespace ctermbg=red guibg=red " hl on file opening
match ExtraWhitespace /\s\+$\| \+\ze\t/

" set shortmess=+I " hide greeting window

" You can replace all the tabs with spaces in the entire file with
" > :%retab

" ---------- SYSTEM ----------
" set exrc " disable load non-default .vimrc
" set secure " disable specific non-secure commands from non-default .vimrc

set timeoutlen=500
set ttimeoutlen=0 " exit visual mode
set encoding=UTF-8
set fenc=UTF-8
set termencoding=UTF-8
set splitright
set splitbelow
set tags=./tags
set cursorline
set pumheight=10 " rowcount in popup window

set showmatch " highlight matching braces
set history=128
set undolevels=512
set undofile " save undo history to file
set undodir=$VIMDIR/undo/
set nobackup
set noswapfile
set nocompatible " disable vi compability
set hidden " enable change buffer without save
set autochdir
set fileencodings=utf-8,cp1251,koi8-r,cp866 " autodetection file types

set clipboard=unnamed

let mapleader = ","

autocmd BufWritePre * %s/\s\+$//e " delete whitespaces on writing

" ---------- KEYMAPPING ----------
" enable russian keyboard layout mapping
" so ~/.vimrussianrc

" remap to JKL;
noremap ' ;
noremap ; l
noremap l k
noremap k j
noremap j h
noremap h <Nop>

" disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" change window
noremap <c-w>j <c-w>h
noremap <c-w>k <c-w>j
noremap <c-w>l <c-w>k
noremap <c-w>; <c-w>l

" screen lines
noremap gl gk
noremap gk gj

map q: :q
inoremap jj <Esc>

" buffers and tabs
map <Leader>t :tabnew<cr>
nmap <" Leader>t :tabnew<cr>

map <Leader>c :tabclose<cr>
nmap <Leader>c :tabclose<cr>

map <Leader>l :lopen<cr> " open locations
nmap <Leader>l :lopen<cr>

map <Leader>q :lclose<cr> " close locations
nmap <Leader>q :lclose<cr>

" fast replace
nmap \ :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>

" F2 save the file
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i

" F3 copy to clipboard
vmap <F3> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
" F4 paste from clipboard
nmap <F4> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" map <F6> :Dox<CR>

" build using makeprg with <F7>
map <F7> :!make<CR>
" build using makeprg with <S-F7>
map <S-F7> :!make clean all<CR>

" F6 toggle .cpp / .h files
map <F6> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

map <F12> <C-]> " goto definition with F12

" F5 - make
" function Vim_msg_show( )
"	let s:vim_msg_state=1
"	botright copen
" endfunction

" map <F5> :make!<cr><cr>:call Vim_msg_show( )<cr>
" vmap <F5> <esc>:make!<cr><cr>:call Vim_msg_show( )<cr>
" imap <F5> <esc>:make!<cr><cr>:call Vim_msg_show( )<cr>

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
"
" ----- ----- PLUGINS ----- -----
" vim-plug plugin manager
call plug#begin('~/.vim/plugged')
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'mrtazz/simplenote.vim'
Plug 'scrooloose/nerdtree'
Plug 'matze/vim-move'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'

Plug 'sirver/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
" Plug 'vim-scripts/DoxygenToolkit.vim'
call plug#end()

let g:DoxygenToolkit_authorName="Alexey Minchakov <lexaaim@gmail.com>"

source ~/.simplenoterc
let g:SimplenoteSortOrder = "title"

nnoremap <Leader>s :SimplenoteList<Enter>

nnoremap <Leader>f :NERDTreeToggle<Enter>
" let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
" let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 1

let g:move_key_modifier = 'C'

let g:UltiSnipsExpandTrigger="<c-TAB>"
" let g:UltiSnipsJumpForwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-l>"

let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
" overwrite default
let g:session_default_to_last = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" airlines
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
" enable tab management
let g:airline#extensions#tabline#enabled = 1
" always show tabline
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
" show file extension
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_warning = ''
let g:airline_section_error = ''
" disable closing tab with mouse
let g:airline#extensions#tabline#show_close_button = 0
" disable separator
let g:airline#extensions#tabline#left_alt_sep = ''
" disable tagbar
let g:airline#extensions#tagbar#enabled = 0
" show tab number
let g:airline#extensions#tabline#show_tab_nr = 1
" show only tab number
let g:airline#extensions#tabline#tab_nr_type = 1

