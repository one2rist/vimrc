" ==============================================
" HELP
" ==============================================

" SEARCH AND REPLACE
" :%s/foo/bar/gci flags: %=all file, g=global (all matches), c=confirm, i=case

" SEARCH IN FILES RECURSE FROM PWD
" :vimgrep /some text/gj ./**/* | copen
" grep --exclude={*.o,*.so} -rnw -e assignStructFieldFromJSON | grep -v 'isError' &> assignStructFieldFromJSON

" COPY TO SYSTEM REGISTER
" "+y{optional move} or
" "*y - another system register

" "+p - paste from system clipb
" ":p - paste last command
" "/p - paste last search
" "1y - copy  to   1      register
" "1p - paste from 1      register

" SYSTEM USEFUL COMMANDS
" sudo kill $(sudo lsof -t -i:20351) // kill em all who using port(address) 20351

set exrc
set secure
set number
set nocp
execute pathogen#infect()

syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set noexpandtab

set incsearch
set hlsearch
set hidden
set ignorecase
" set splitright


" turn of entering Ex mode
map q: <Nop>
nnoremap Q <nop>


" ============================================
" Function keys commands
" ============================================

" jk = esc
inoremap jk <esc>
" cursor is always in the middle of the page:
nnoremap j jzz
nnoremap k kzz

" open-close NerdTree
map <c-n> :NERDTreeToggle<cr>

" swith .h and .cpp
nnoremap gH :call CppToH()<CR>
nnoremap gh :call SwitchBuff()<CR>

" go to tab number #
nnoremap g1 :tabn 1<CR>
nnoremap g2 :tabn 2<CR>
nnoremap g3 :tabn 3<CR>
nnoremap g4 :tabn 4<CR>
nnoremap g5 :tabn 5<CR>
nnoremap g6 :tabn 6<CR>
nnoremap g7 :tabn 7<CR>
nnoremap g8 :tabn 8<CR>
nnoremap g9 :tabn 9<CR>
nmap <leader><leader> :ls<CR>
nmap <leader>1  :buf  1<CR>:only<CR>
nmap <leader>2  :buf  2<CR>:only<CR>
nmap <leader>3  :buf  3<CR>:only<CR>
nmap <leader>4  :buf  4<CR>:only<CR>
nmap <leader>5  :buf  5<CR>:only<CR>
nmap <leader>6  :buf  6<CR>:only<CR>
nmap <leader>7  :buf  7<CR>:only<CR>
nmap <leader>8  :buf  8<CR>:only<CR>
nmap <leader>9  :buf  9<CR>:only<CR>
nmap <leader>10 :buf 10<CR>:only<CR>

" move tab to the left/right
nnoremap g- :tabm -1<CR>
nnoremap g= :tabm +1<CR>

" navigating woindows up down left right
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" leader-commands, leader is \-key
nnoremap <leader><CR> i<CR><esc>
nnoremap <leader>/ I//<esc>
nnoremap <leader>? 0f/xx

vnoremap <leader>{ di{}<esc>P
vnoremap <leader>} di{ <esc>pi }<esc>

" add/remove space near braces
nnoremap <leader><space> %a<space><esc>%%i<space><esc>
nnoremap <leader><backspace> %lx%%hx

nnoremap <leader>{ i{ <esc>ea }<esc>
nnoremap <leader>( i( <esc>ea )<esc>
nnoremap <leader>[ i[ <esc>ea ]<esc>
nnoremap <leader>< i< <esc>ea ><esc>
nnoremap <leader>" i"<esc>ea "<esc>
nnoremap <leader>' hxxhea <esc>p


" change working dir to home
nmap chd :cd ~<CR>CD
" change working dir to current file location
nmap CD :cd %:p:h<CR>
" copy file path to buffer
nmap CP :put =expand('%:p')<CR>
" gen header
nmap HE ggO#ifndef <esc>:put = expand('%:t:r')<CR>VUkJA_H<esc>o#define <esc>:put = expand('%:t:r')<CR>VUkJA_H<CR><esc>Go#endif //<esc>:put = expand('%:t:r')<CR>VUkJA_H<esc>O<esc>gg


" vim register goto system register (like ctrl-c):
nnoremap <leader>c :let @+=@"<CR>
" call git diff on the current file, arg let u specify the commit:
nnoremap <leader>d :call GitDiff("HEAD~")
" send the list of files under commit to the global file:
nnoremap <leader>g :call SystemToFile("git diff-tree --name-only -r HEAD", "tabe")
" turn off highlighting:
nnoremap <leader>h :nohlsearch<CR>
" grep recursively the word and send results to the global file:
nnoremap <leader>f :call SystemToFile("grep --include='*.h' -rni -e helo", "tabe")
nnoremap <leader>F :call SystemToFile("grep --include={*.h,*.cpp} -rni -e helo", "tabe")
" locate file and send results to global file:
nnoremap <leader>l :call LocateFile(".h")
" send yanked (copied) to global Notes file:
nnoremap <leader>n :call SendRegisterToNotes()
" open file under cursor:
nnoremap <leader>o :call ReadLine_OpenFile("tabe")
" copy current file path to system register:
nnoremap <leader>p :let @+=@%<CR>
nnoremap <leader>P :let @+=getcwd()."/".@%<CR>
" close all windows of this file
nnoremap <leader>r :call CloseOtherwindowsOfThis("e")
" locate file and send results to global file:
nnoremap <leader>s :call SystemToFile("locate -i $(pwd)*hello*.h", "tabe")
" temp file in a new tab:
nnoremap <leader>t :call OpenTemp("tabe")<CR>
" system register goto vim register (like ctrl-v):
nnoremap <leader>v :let @"=@+<CR>



" ============================================
" Function keys commands
" ============================================

" F2 save file:
nnoremap <F2> <esc>:w<CR>
inoremap <F2> <esc>:w<CR>
" F3 open default vimrc
nnoremap <F3> <esc>:tabe ~/.vimrc<CR>
inoremap <F3> <esc>:tabe ~/.vimrc<CR>
" F4 close file
nnoremap <F4> <ESC>:call SendClosedFileNameToTemp()<CR>:q<CR>
inoremap <F4> <ESC>:let @+=@%<CR>:q<CR>

nnoremap <F5> <ESC> :wa <CR> :! g++ -std=c++11 -g % -o ~/run && ~/run <CR>
inoremap <F5> <ESC> :wa <CR> :! g++ -std=c++11 -g % -o ~/run && ~/run <CR>
" F6 save + run qmlscene
nnoremap <F6> <ESC>:wa<CR>:!qmlscene %<CR>
inoremap <F6> <ESC>:wa<CR>:!qmlscene %<CR>
" F8 open default vimrc
nnoremap <F8> <esc>:tabe ~/vim/notes.temp<CR>
inoremap <F8> <esc>:tabe ~/vim/notes.temp<CR>

" F9 save + run qmlscene
nnoremap <F9> <ESC>:wa<CR>:call ShowFile()<CR>
inoremap <F9> <ESC>:wa<CR>:call ShowFile()<CR>
" F10 save + run qmlscene
nnoremap <F10> <ESC>:wa<CR>:call OpenSearch("tabe")<CR>
inoremap <F10> <ESC>:wa<CR>:call OpenSearch("tabe")<CR>
" F11 save + run qmlscene
nmap <c-F11> <ESC>:wa<CR>:call OpenNotes("tabe")<CR>
imap <c-F11> <ESC>:wa<CR>:call OpenNotes("tabe")<CR>
" F12 save + run qmlscene
nmap <F12> <ESC>:wa<CR>:call OpenNotes("tabe")<CR>
imap <F12> <ESC>:wa<CR>:call OpenNotes("tabe")<CR>

"nmap <F12> :wa <CR> :! g++ -std=c++11 -I/usr/local/boost_1_65_1 main.cpp -o run -L/usr/local/boost_1_65_1/stage/lib/ -lboost_system -lboost_thread -lboost_chrono -pthread -lboost_date_time && ./run<CR>


" XXXXXXXXXXXXXXXXXXXX:
"                      COLORSCEME:
" XXXXXXXXXXXXXXXXXXXX:

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" show white caracters: :set list, :set nolist
" set listchars=eol:¬,tab:>·,trail:-,extends:>,precedes:<,space:·


" highlight trealing white space
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
nnoremap <C-y> :%s/\s\+$//gc<CR>



" XXXXXXXXXXXXXXXXXXXX:
"                      AUTOCOMMANDS:
" XXXXXXXXXXXXXXXXXXXX:

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Retabulate the whole file when open it
autocmd BufReadPost * :%retab

" Disable automatic comment insertion:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" XXXXXXXXXXXXXXXXXXXX:
"                      FUNCTIONS:
" XXXXXXXXXXXXXXXXXXXX:

let g:vimsearch = "~/vim/search.temp"
let g:vimnotes  = "~/vim/notes.temp"
let g:vimtemp   = "~/vim/temp.temp"

function! CppToH()

  if match(expand("%"), '\.cpp') > 0
      exe "e %:r.h"
  elseif match(expand("%"), '\.h') > 0
      exe "e %:r.cpp"
  endif

endfun

function! SwitchBuff()

  if match(expand("%"), '\.cpp') > 0
      exe "w"
      exe "buffer" expand("%:r").".h"
  elseif match(expand("%"), '\.h') > 0
      exe "w"
      exe "buffer" expand("%:r").".cpp"
  endif

endfun

function! OpenSearch(opencmnd)
    exe a:opencmnd g:vimsearch
    exe "edit"
endfun

function! OpenNotes(opencmnd)
    exe a:opencmnd g:vimnotes
    exe "edit"
endfun

function! OpenTemp(opencmnd)
    exe a:opencmnd g:vimtemp
    exe "edit"
endfun

function! ReadLine_OpenFile(open) " read line and open file
    let l:path = getline(".")
    exe a:open split(l:path, ":")[0]
endfun

function! ShowFile()
    exe "only"
    let l:path = getline(".")
    exe "split" split(l:path, ":")[0]
    exe "resize" 50
endfun

function! SystemToFile(command, open)
    call system(a:command . " > " . g:vimsearch . " 2>&1")
    exe  a:open g:vimsearch
    exe "edit"
endfun

function! LocateFile(tail)
    let l:path = getcwd() . "*" . expand("<cword>")
    call system("locate -i " . l:path . a:tail . " > " . g:vimsearch . " 2>&1")
    exe "tabe" g:vimsearch
    exe "edit"
endfun

function! GitDiff(head)
    call SystemToFile("git diff " . a:head . " " . expand("%"), "vs")
endfun

function! SendRegisterToNotes()
    call system("echo \"" . @" . "\" >> " . g:vimnotes)
endfun

function! SendClosedFileNameToTemp()
    call system("echo \"" . getcwd() . "/" . @% . "\" >> " . g:vimtemp)
endfun

function! CloseOtherwindowsOfThis(opencmnd)
    let l:path = @%
"    exe "bd" l:path
    exe "bw" bufnr("%")
    exe a:opencmnd l:path
    exe "edit"
endfun
