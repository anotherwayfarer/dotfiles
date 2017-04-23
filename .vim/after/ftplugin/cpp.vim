map <F5> <esc>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" ctags
set tags=./tags,tags
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl2
" set tags+=~/.vim/tags/qt4

" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q /usr/include/c++/5.4.0/
" mv tags cpp
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q /usr/include/SDL2/
" mv tags sdl2

" let &path.="src/include,/usr/include/AL,"
" build using makeprg with <F7>
map <F7> :make<CR><CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR><CR>

" map <F8> :!./bin/<CR>

" toggle .cpp / .h files
map <F12> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Open Quickfix window automatically after running :make
" augroup OpenQuickfixWindowAfterMake
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow
"  augroup END
