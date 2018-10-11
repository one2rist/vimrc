" ==============================================
" HELP
" ==============================================

" SEARCH AND REPLACE
" :%s/foo/bar/gci flags: %=all file, g=global (all matches), c=confirm, i=case

" SEARCH IN FILES RECURSE FROM PWD
" :vimgrep /some text/gj ./**/* | copen

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
set splitright

" Disable automatic comment insertion:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" turn of entering Ex mode
map q: <Nop>
nnoremap Q <nop>


" ============================================
" Function keys commands
" ============================================

" jk = esc
inoremap jk <esc>

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

" move tab to the left/right
nnoremap g- :tabm -1<CR>
nnoremap g= :tabm +1<CR>

" navigating woindows up down left right
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" leader-commands, leader is \-key
nnoremap <leader>h :nohlsearch<CR>
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

nnoremap j jzz
nnoremap k kzz
inoremap <CR> <esc>zza<CR>


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
nnoremap <F4> <ESC>:q<CR>
inoremap <F4> <ESC>:q<CR>

" F5 save + compile + run C++11 code
nnoremap <F5> <ESC> :wa <CR> :! g++ -std=c++11 -g % -o ~/run && ~/run <CR>
inoremap <F5> <ESC> :wa <CR> :! g++ -std=c++11 -g % -o ~/run && ~/run <CR>
" F6 save + compile + run C++14 code
nnoremap <F6> <ESC> :wa <CR> :! g++ -std=c++14 -g % -o ~/run && ~/run <CR>
inoremap <F6> <ESC> :wa <CR> :! g++ -std=c++14 -g % -o ~/run && ~/run <CR>
" F7 save + compile + run C++17 code
nnoremap <F7> <ESC> :wa <CR> :! g++ -std=c++17 -g % -o ~/run && ~/run <CR>
inoremap <F7> <ESC> :wa <CR> :! g++ -std=c++17 -g % -o ~/run && ~/run <CR>
" F8 save + run qmlscene
nnoremap <F8> <ESC>:wa<CR>:!qmlscene %<CR>
inoremap <F8> <ESC>:wa<CR>:!qmlscene %<CR>
" F9 save + run qmlscene
nnoremap <F9> <ESC>:wa<CR>:call OpenFile()<CR>
inoremap <F9> <ESC>:wa<CR>:call OpenFile()<CR>
" F10 save + run qmlscene
nnoremap <F10> <ESC>:wa<CR>:call OpenTemp()<CR>
inoremap <F10> <ESC>:wa<CR>:call OpenTemp()<CR>

"nmap <F12> :wa <CR> :! g++ -std=c++11 -I/usr/local/boost_1_65_1 main.cpp -o run -L/usr/local/boost_1_65_1/stage/lib/ -lboost_system -lboost_thread -lboost_chrono -pthread -lboost_date_time && ./run<CR>


" ============================================
" Highlight commands
" ============================================
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" turn off highlighted text
map <C-m> <esc>/}<CR>v%=:nohlsearch<CR>
" :set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" highlight trealing white space
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
nnoremap <C-y> :%s/\s\+$//gc<CR>



" ======================
" NERDTree and WorkingDir manipulations
" ======================

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Retabulate the whole file when open it
autocmd BufReadPost * :%retab

" change working dir to home
nmap chd :cd ~<CR>CD
" change working dir to current file location
nmap CD :cd %:p:h<CR>
" copy file path to buffer
nmap CP :put =expand('%:p')<CR>
" gen header
nmap HE ggO#ifndef <esc>:put = expand('%:t:r')<CR>VUkJA_H<esc>o#define <esc>:put = expand('%:t:r')<CR>VUkJA_H<CR><esc>Go#endif //<esc>:put = expand('%:t:r')<CR>VUkJA_H<esc>O<esc>gg



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

let g:vimtemp = "~/vimtemp"

function! LocateFile(tail)
    let l:path = getcwd() . "*" . expand("<cword>")
    call system("locate -i " . l:path . a:tail . " &> " . g:vimtemp)
    exe "tabe" g:vimtemp
endfun

function! LocateCommited(head)
    call system("git diff-tree --name-only -r HEAD~" . a:head . " &> " . g:vimtemp)
    exe "tabe" g:vimtemp
endfun

function! OpenFile()
    exe "e" getline(".")
endfun

function! OpenTemp()
    exe "e" g:vimtemp
endfun

nmap <leader>of :call OpenFile()
nmap <leader>lg :call LocateCommited("0")
nmap <leader>lo :call LocateFile("*")
nmap <leader>lh :call LocateFile("*.h")
nmap <leader>lH :call LocateFile(".h")
nmap <leader>lc :call LocateFile("*.cpp")
nmap <leader>lC :call LocateFile(".cpp")
nmap <leader>lq :call LocateFile("*.qml")
nmap <leader>lQ :call LocateFile(".qml")
