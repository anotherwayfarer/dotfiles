syntax enable
" colorscheme darkblue
" colorscheme monokai
" colorscheme railscasts
" colorscheme mustang
colorscheme jellybeans

filetype off
filetype plugin on
filetype plugin indent on
" set autoindent " copy indent length from prev line

set tabstop=4 "show existing tab with 4 spaces
set shiftwidth=4 " add 4 spaces with '>'
set shiftround " round multiple of four
set noexpandtab
" let _curfile = expand("%:t")
" if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
" set noexpandtab " don't replace tabs with places when it's makefile
" endif

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

" highlight column
autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=101  " mark 101 column
" highlight text
" highlight OverLength ctermbg=red ctermfg=white guibg=#9b59b6
" match OverLength /\%101v.\+/
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

" set shortmess=+I " hide greeting window

" You can replace all the tabs with spaces in the entire file with

" > :%retab
" ---------- SYSTEM ----------
" set exrc " disable load non-default .vimrc
" set secure " disable specific non-secure commands from non-default .vimrc

set timeoutlen=500
" exit visual mode
set ttimeoutlen=0
set encoding=UTF-8
set fenc=UTF-8
set termencoding=UTF-8
set splitright
set splitbelow
set tags=./tags
set cursorline
" rowcount in popup window
set pumheight=10

set showmatch " highlight matching braces
set history=128
set undolevels=512
set undofile " save undo history to file
set undodir=$VIMDIR/undo/
set nobackup
set noswapfile
" autocmd VimLeavePre * silent mksession ~/.vim/my_session " save session before close
set nocompatible " disable vi compability
set hidden " always keep buffer in memory
set autochdir
set fileencodings=utf-8,cp1251,koi8-r,cp866 " autodetection file types
" set visualbell " disable beeps

set clipboard=unnamed

let mapleader = ","

autocmd BufWritePre * %s/\s\+$//e

" ---------- KEYMAPPING ----------
" inoremap { {}<Esc>i
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i

" disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" change window
noremap <c-w>j <c-w><Left>
noremap <c-w>k <c-w><Down>
noremap <c-w>l <c-w><Up>
noremap <c-w>; <c-w><Right>

" easier moving of code blocks in visual mode
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
map q: :q
inoremap jj <Esc>
vnoremap jj <Esc>

" buffers and tabs
map <Leader>t :tabnew<cr>
nmap <Leader>t :tabnew<cr>
" imap <Leader>t <esc>:tabnew<cr>i

map <Leader>p :tabp<cr>
nmap <Leader>p :tabp<cr>
" imap <Leader>p <esc>:tabp<cr>i

map <Leader>n :tabn<cr>
nmap <Leader>n :tabn<cr>
" imap <Leader>n <esc>:tabn<cr>i

map <Leader>c :tabclose<cr>
nmap <Leader>c :tabclose<cr>
" imap <Leader>c <esc>:tabclose<cr>i

map <Leader>l :lopen<cr> " open locations
nmap <Leader>l :lopen<cr>
" imap <Leader>l :lopen<cr>

map <Leader>q :lclose<cr> " close locations
nmap <Leader>q :lclose<cr>
" imap <Leader>q <esc>:lclose<cr>

" fast replace
nmap ' :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>
" fast search
nmap \ /<c-r>=expand("<cword>")<cr> " fast replace ?

" set pastetoggle=<F2>
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
vmap <F3> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <F4> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>

map <F6> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR> " toggle cpp/h files
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

" remap to JKL;
"noremap ' ;
noremap ; l
noremap l k
noremap k j
noremap j h
noremap h <Nop>

" enable russian keyboard layout mapping
" so ~/.vimrussianrc

" ----- ----- PLUGINS ----- -----
" vim-plug plugin manager
call plug#begin('~/.vim/plugged')
Plug 'mrtazz/simplenote.vim'
Plug 'scrooloose/nerdtree'
Plug 'matze/vim-move'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'sirver/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/DoxygenToolkit.vim'
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

" nerd commenter
let g:NERDSpaceDelims = 1

" airlines
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
" включить управление табами
let g:airline#extensions#tabline#enabled = 1
" всегда показывать tabline
let g:airline#extensions#tabline#tab_min_count = 0
" такое же поведение, как и в sublime: если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail'
" скрыть буферы
let g:airline#extensions#tabline#show_buffers = 0
" имя файла + расширение :help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'
" убираем раздражающие ненужные красные панели с предупреждениями или ошибками. Предупреждения, как по мне, не нужны, поскольку ругаются даже на trailing-spaces и разные отступы: например табы и пробелы (привет от phpDoc). Для ошибок и так открывается дополнительное окно. Впрочем, вам решать.
let g:airline_section_warning = ''
let g:airline_section_error = ''
" убираем "X" для закрытия вкладки мышью (мышью!?)
let g:airline#extensions#tabline#show_close_button = 0
" убираем разделитель для вкладок
let g:airline#extensions#tabline#left_alt_sep = ''
" отключаем tagbar
let g:airline#extensions#tagbar#enabled = 0
" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1
" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1

