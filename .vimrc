syntax enable
" colorscheme darkblue
" colorscheme monokai
" colorscheme railscasts
" colorscheme mustang
" colorscheme jellybeans
colorscheme smyck
" colorscheme desert

filetype plugin indent on
runtime macros/matchit.vim " enable if-else match search by pressing %
set fileformat=unix

" tab settings
set softtabstop=4
set tabstop=4 "show existing tab with 4 spaces
set shiftwidth=4 " add 4 spaces with '>'
set shiftround " round multiple of four
set expandtab " always replace Tab with Spaces. Use <c-v><Tab>

" case settings
set ignorecase
set smartcase

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

set mouse=a " enable mouse
set winminheight=0 " window size
set winminwidth=0

set laststatus=2 " always view status line
set showcmd " view current commands
set textwidth=100
set comments=sl:/*,mb:\ *,elx:\ */

autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=101  " mark 101 column
highlight ExtraWhitespace ctermbg=red guibg=red " hl on file opening
match ExtraWhitespace /\s\+$\| \+\ze\t/

" set shortmess=a

" You can replace all the tabs with spaces in the entire file with
" > :%retab

" ---------- SYSTEM ----------
set exrc " enable load non-default .vimrc
set secure " disable specific non-secure commands from non-default .vimrc
set spelllang=en

set timeoutlen=500
set ttimeoutlen=0 " exit visual mode
set encoding=UTF-8
set fenc=UTF-8
set termencoding=UTF-8
set splitright
set splitbelow
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
" set autochdir
set fileencodings=utf-8,cp1251,koi8-r,cp866 " autodetection file types

set clipboard=unnamed

let mapleader = ","

autocmd BufWritePre * %s/\s\+$//e " delete whitespaces on writing

" ---------- KEYMAPPING ----------
" enable russian keyboard layout mapping
" so ~/.vimrc_russian

nnoremap <c-s> <Nop>

" remap to JKL;
" noremap ' ;
" noremap ; l
" noremap l k
" noremap k j
" noremap j h
" noremap h <Nop>

" disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" change window
" noremap <c-w>j <c-w>h
" noremap <c-w>k <c-w>j
" noremap <c-w>l <c-w>k
" noremap <c-w>; <c-w>l

" screen lines
" noremap gl gk
" noremap gk gj

map q: :q
map :Q :q
map :W :w
inoremap jj <Esc>

nnoremap & :&&<CR>
xnoremap & :&&<CR>

" buffers and tabs
map <Leader>t :tabnew<cr>
nmap <" Leader>t :tabnew<cr>

map <Leader>c :tabclose<cr>
nmap <Leader>c :tabclose<cr>

" fast replace
nmap \ :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>

" Doxygen
map <F1> :Dox<CR>

" F2 save the file
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i

" F3 copy to clipboard
vmap <F3> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
" F4 paste from clipboard
nmap <F4> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p


" ----- ----- PLUGINS ----- -----
" vim-plug plugin manager
call plug#begin('~/.vim/plugged')
" Plug 'Valloric/YouCompleteMe'
" Plug 'easymotion/vim-easymotion'
" Plug 'sirver/ultisnips'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-commentary'
" Plug 'vim-scripts/OmniCppComplete'
" Plug 'vim-syntastic/syntastic'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'matze/vim-move'
" Plug 'mrtazz/simplenote.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 'antoyo/vim-licenses'
Plug 'justmao945/vim-clang'
Plug 'alpertuna/vim-header'
Plug 'tmux-plugins/vim-tmux'
call plug#end()

let g:header_field_author = 'Alexey Minchakov'
let g:header_field_author_email = 'lexaaim@gmail.com'


let g:licenses_copyright_holders_name = 'Alexey Minchakov <lexaaim@gmail.com>'
"let g:licenses_authors_name = 'Alexey Minchakov <lexaaim@gmail.com>'
let g:licenses_default_commands = ['gpl', 'mit' ]


let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++14 -stdlib=libstdc++'

" source ~/.simplenoterc
" let g:SimplenoteSortOrder = "title"
" nnoremap <Leader>s :SimplenoteList<Enter>

nnoremap <Leader>f :NERDTreeToggle<Enter>

" let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
" let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1

let g:move_key_modifier = 'C'

" let g:session_autoload = 'yes'
" let g:session_autosave = 'yes'
" let g:session_autosave_periodic = 5
" let g:session_autosave_silent = 1
" overwrite default
" let g:session_default_to_last = 1

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

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

let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Alexey Minchakov <lexaaim@gmail.com>"
let g:DoxygenToolkit_licenseTag="WTFPLv2 License"
let g:DoxygenToolkit_versionString="1.0"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
