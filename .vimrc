syntax enable
colorscheme my_theme
" to reload vimrc use :so $MYVIMRC

" disable compatibility with vi. It should be placed before other settings
set nocompatible

filetype plugin indent on       " depend indent rules on file types
runtime macros/matchit.vim      " enable if-else matching search by pressing %
set fileformat=unix

augroup filetypedetect
" set mutt files filetype=mail
    autocmd BufRead,BufNewFile *mutt-* setfiletype mail
augroup END

" limit the width of text to 72 characters when it is a mail
au BufRead /tmp/mutt-* set tw=72

" each time you save the file delete any trailing whitespace at the eol
" if current file format not in blacklist
let blacklist = ['rb', 'js', 'pl', 'make']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e

set tabstop=4                   " how many columns a tab counts for
set softtabstop=4               " use the same value as tabstop
set shiftwidth=4                " use with reindent operations >> and <<
set expandtab                   " expand tab with spaces, use <C-v><Tab> instead of <Tab>
set shiftround                  " round spaces multiple of four
" set autoindent                  " auto-indent new lines, doesn't need if ft plugin on

set list                        " make whitespace characters visible
set listchars=tab:>-            " show <Tab> like >---
set fillchars+=vert:\           " use space character for buffer vert separators

" If you search for something containing uppercase characters,
" it will do a case sensitive search; if you search for something
" purely lowercase, it will do a case insensitive search.
" You can use \c and \C to override this
set ignorecase
set smartcase

set hlsearch                    " search highlighting
set incsearch                   " search while typing

set number                      " show row numbers
set numberwidth=5               " width of row numbers column
" set cpoptions+=n                " use the number column for the text
" set relativenumber              " use relative row numbers
" set ruler                       " show status line like ruler

" define user colors for status line customization.
hi User1 ctermfg=1              " red
hi User2 ctermfg=2              " green
hi User3 ctermfg=3              " yellow
hi User4 ctermfg=4              " light blue
hi User5 ctermfg=5              " purple
hi User6 ctermfg=6              " blue
hi User7 ctermfg=7              " light gray
hi User8 ctermfg=8              " gray
hi User9 ctermfg=9              " pink

set statusline=                 " %f filename
set statusline+=%7*\ %F\ %*     " %F full path
set statusline+=%2*%m%*         " %m modified flag
set statusline+=%=              " %= switch to right side
set statusline+=%9*%{&ff}\      " %{&ff} file format
set statusline+=%y%*\ -         " %y file type
set statusline+=\ %3*%l\/       " %l current line number
set statusline+=%L\ :\          " %L max line number
set statusline+=%c%*\ \         " %c current column number
set statusline+=%4*0x%04B%*     " 0x%04B character under cursor

" set scrolljump=1                " jumping lines count when the cursor within
" set scrolloff=5                 " scrolloff lines of the edge of the screen

set mouse=a                     " enable mouse
set winminheight=0
set winminwidth=0
set wrap                        " disable auto line breaking after 80th column
set textwidth=0                 " turn off physical file wrapping
set wrapmargin=0                " turn off physical file wrapping

set laststatus=2                " always view status line
set showcmd                     " view current commands
set cmdheight=2                 " command line height in lines
" set comments=sl:/*,mb:\ *,elx:\ */

" disable auto commenting when you insert blank line after a comment line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" mark 81st column
" autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=81

" highlight extra whitespaces on file opening
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

" set shortmess=a                 " make vim messages shorter
" You can replace all the tabs with spaces in the entire file with :%retab

set exrc                        " enable load non-default .vimrc

" disable specific non-secure commands from non-default .vimrc
set secure

set timeoutlen=500              " set mapping delay in ms
set ttimeoutlen=0               " set key code delay in ms

" how vim represent characters internally
set encoding=UTF-8
" auto detect encoding written to file
set fileencodings=UTF-8,cp1251,koi8-r,cp866
" define how keyboard encodes what you type
set termencoding=UTF-8

" open new split panes to right and bottom
set splitright
set splitbelow

set cursorline                  " show current line
set pumheight=10                " limit popup menu height
set showmatch                   " highlight matching braces

set history=128                 " history size for Ex mode (:command)
set undolevels=512              " history size for undo command
set undofile                    " save undo history to file
set undodir=$HOME/.vim/undo/    " make sure to create this directory

" spell
set spelllang=en
set spellfile=$HOME/vim/spell/en.utf-8.add
" for enabling spell checking use :set spell, for disabling :set spell!
" to move cursor to the next misspelled word, enter ]s
" to move cursor to the previous misspelled word, enter [s
" to add word in spell file, enter zg
" to show spelling suggestions, enter z=

set nobackup                    " disable backups for editing file
set noswapfile                  " disable .swp files
set hidden                      " keep invisible buffers loaded in memory
set clipboard=unnamed           " for using anonymous register
set noautochdir                 " doesn't change working directory to opened file

let mapleader = ","             " set prefix key

" disable arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

map q: :q
map :qq :q
map :qQ :q
map :Q :q
map :W :w

inoremap jj <Esc>
" nnoremap & :&&<CR>
" xnoremap & :&&<CR>

" buffers and tabs
" map <Leader>t :tabnew<cr>
" nmap <Leader>t :tabnew<cr>
"
" map <Leader>c :tabclose<cr>
" nmap <Leader>c :tabclose<cr>

" fast replace
nmap \ :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>

" bind <F3> to copy to X clipboard
vmap <F3> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" bind F4 to paste from X clipboard
nmap <F4> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS vim-plug plugin manager
call plug#begin('~/.vim/plugged')
" Plug 'Valloric/YouCompleteMe'             " c++ recommended
" Plug 'easymotion/vim-easymotion'
" Plug 'sirver/ultisnips'                   " c++ recommended
" fswitch                                   " c++ recommended
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-commentary'
" Plug 'vim-scripts/OmniCppComplete'
" Plug 'vim-syntastic/syntastic'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neosnippet.vim'
Plug 'matze/vim-move'                       " !
" Plug 'mrtazz/simplenote.vim'              " ~
Plug 'scrooloose/nerdcommenter'             " !
Plug 'scrooloose/nerdtree'                  " !
" Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'                   " !
Plug 'tpope/vim-unimpaired'                 " ~
" Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'justmao945/vim-clang'
Plug 'alpertuna/vim-header'                 " !
" Plug 'tmux-plugins/vim-tmux'              " --
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-surround
" use ysiw] to change words qwerty   to [qwerty]
" use cs'"  to change 'qwe rty' to "qwe rty"
" use yss(  to change entire line state
" use ds'   to remove the delimiters
" use S' in visual mode to do so
" you can use viw for current word selection

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-move
" use <C-k> to move current line/selection up
" use <C-j> to move current line/selection up

let g:move_key_modifier = 'C'               " set Control as move-modifier key

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-unimpaired
" use :help unimpaired to know hotkeys
" use :q

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN nerdtree
" use mapleader+f to open the tree buffer
" then use ? for help

nnoremap <Leader>f :NERDTreeToggle<Enter>

" open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" open NERDTree automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
" let NERDTreeMinimalUI = 1                   " set minimal NERDTree interface
" let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1                    " enable to show hidden files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-header
" use :AddHeader to insert default author information under cursor
" use :AddMinHeader to insert minified version of author information
" use :AddMitLicense, :AddApacheLicense, :AddGNULicense for add license

let g:header_field_filename = 1             " enable to add filename in header
let g:header_field_author = 'Alexey Minchakov'
let g:header_field_author_email = 'lexaaim@gmail.com'
let g:header_field_timestamp = 1            " enable to add creating date line
let g:header_field_timestamp_format = '%d.%m.%Y'
let g:header_auto_add_header = 0            " disable to add header automatically


let g:licenses_copyright_holders_name = 'Alexey Minchakov <lexaaim@gmail.com>'
let g:licenses_default_commands = ['gpl', 'mit' ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-nerdcommenter
" use :help nerdcommenter to see help
" use ,cc  to comment out the current line or text selected in visual mode.
" use ,cn  same as ,cc but forces nesting.
"!use ,c<Space> to toggle the comment state of the selected line(s).
"       if the topmost selected line is commented, all selected lines
"       are uncommented and vice versa.
" use ,cm  to comment the given lines using only one set of multipart delimiters.
" use ,ci  to toggle the comment state of the selected line(s) individually.
"!use ,cs  to comment out the selected lines with a pretty block formatted layout.
" use ,cy  same as cc except that the commented line(s) are yanked first.
" use ,c$  to comment the current line from the cursor to the end of line.
" use ,cA  to adds comment delimiters to the end of line and goes into insert mode between them.
"!use ,ca  to switche to the alternative set of delimiters.
" use ,cu  to uncomment the selected line(s).

" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" set a language to use its alternate delimiters by default
let g:NERDAltDelims_cpp = 1
" add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'cpp': { 'left': '//' } }
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-clang
" require install ctags(?) clang

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++14 -stdlib=libstdc++'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" doesn't formatted


" source ~/.simplenoterc
" let g:SimplenoteSortOrder = "title"
" nnoremap <Leader>s :SimplenoteList<Enter>

" Doxygen
" map <F1> :Dox<CR>

" let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns   "
" let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
" let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
" let g:DoxygenToolkit_authorName="Alexey Minchakov <lexaaim@gmail.com>"
" let g:DoxygenToolkit_licenseTag="WTFPLv2 License"
" let g:DoxygenToolkit_versionString="1.0"


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
