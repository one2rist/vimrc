set exrc
set secure
set number
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

"highlight trealint white space
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
nnoremap <C-y> :%s/\s\+$//gc<CR>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

inoremap jk <esc>
"go to ..
nnoremap gH :call CppToH()<CR>
nnoremap gh :call SwitchBuff()<CR>
nnoremap g1 :tabn 1<CR>
nnoremap g2 :tabn 2<CR>
nnoremap g3 :tabn 3<CR>
nnoremap g4 :tabn 4<CR>
nnoremap g5 :tabn 5<CR>
nnoremap g6 :tabn 6<CR>
nnoremap g7 :tabn 7<CR>
nnoremap g8 :tabn 8<CR>
nnoremap g9 :tabn 9<CR>
nnoremap g- :tabm -1<CR>
nnoremap g= :tabm +1<CR>


nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader><CR> i<CR><esc>
nnoremap <leader>/ I//<esc>
nnoremap <leader>? 0f/xx

nnoremap <leader><space> i<space><esc>lli<space><esc>h
nnoremap <leader>" i"<esc>ea "<esc>
nnoremap <leader>{ i{ <esc>ea }<esc>
nnoremap <leader>( i( <esc>ea )<esc>
nnoremap <leader>[ i[ <esc>ea ]<esc>
nnoremap <leader>< i< <esc>ea ><esc>
nnoremap <leader>' hxxhea <esc>p

nnoremap j jzz
nnoremap k kzz
inoremap <CR> <esc>zza<CR>
nnoremap fff v%zf

nmap <F2> :w<CR>
imap <F2> <esc>:w<CR>

nmap <F3> :tabe ~/.vimrc<CR>
imap <F3> <ESC>:tabe ~/.vimrc<CR>

nmap <F4> :q<CR>
imap <F4> <ESC>:q<CR>

map <F5> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" save + compile + run C++ code
nmap <F6> :wa <CR> :! g++ -std=c++17 -g % -o ~/run && ~/run<CR>
imap <F6> <ESC> :wa <CR> :! g++ -std=c++17 -g % -o ~/run && ~/run <CR>

" save + compile + run C++ code
nmap <F7> :wa <CR> :! g++ -std=c++14 -g % -o ~/run && ~/run <CR>
imap <F7> <ESC> :wa <CR> :! g++ -std=c++14 -g % -o ~/run && ~/run <CR>

" save + compile + run C++ code
nmap <F8> :wa <CR> :! g++ -std=c++11 -g % -o ~/run && ~/run<CR>
imap <F8> <ESC> :wa <CR> :! g++ -std=c++11 -g % -o ~/run && ~/run <CR>

nmap <F9> :wa<CR>:!qmlscene %<CR>

nmap <F10> :wa<CR>:!make && ./main<CR>

nmap <F12> :wa <CR> :! g++ -std=c++11 -I/usr/local/boost_1_65_1 main.cpp -o run -L/usr/local/boost_1_65_1/stage/lib/ -lboost_system -lboost_thread -lboost_chrono -pthread -lboost_date_time && ./run<CR>
imap <F12> <ESC> :wa <CR> :! c++ -std=c++11 -I /usr/local/boost_1_65_0 main.cpp -o run -lboost_system<CR>


" turn of entering Ex mode
map q: <Nop>
nnoremap Q <nop>

map <C-m> <esc>/}<CR>v%=:nohlsearch<CR>

" navigating woindows
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" change working dir to home
nmap chd :cd ~<CR>CD
" change working dir to current file location
nmap CD :cd %:p:h<CR>
" copy file path to buffer
nmap CP :put =expand('%:p')<CR>
" gen header
nmap HE ggO#ifndef <esc>:put = expand('%:t:r')<CR>VUkJA_H<esc>o#define <esc>:put = expand('%:t:r')<CR>VUkJA_H<CR><esc>Go#endif //<esc>:put = expand('%:t:r')<CR>VUkJA_H<esc>O<esc>gg



"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <c-n> :NERDTreeToggle<cr>

autocmd BufReadPost * :%retab

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

" :set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" SYSTEM USEFUL COMMANDS
" sudo kill $(sudo lsof -t -i:20351) // kill em all who using port(address) 20351