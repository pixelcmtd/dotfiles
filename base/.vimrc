set nocompatible
let mapleader = " "
syntax on
filetype plugin indent on
set laststatus=2
set number relativenumber
set so=999
setglobal fileencoding=utf-8
set encoding=utf-8 termencoding=utf-8 fileencodings=utf-8
set wildmenu wildignore=*.o,*.a,*.la,*.lo,*.swp,.svn,.git
set showcmd
set hlsearch ignorecase smartcase
set backspace=indent,eol,start
set shiftwidth=8 softtabstop=8 expandtab autoindent
set confirm
set visualbell t_vb= t_Co=256
set mouse=a
set spelllang=de,en
set notimeout ttimeout ttimeoutlen=5

exec system("mkdir -p ~/.vim/swapfiles")
set dir=~/.vim/swapfiles

exec system("mkdir -p ~/.vim/backupfiles")
set bdir=~/.vim/backupfiles

exec system("mkdir -p ~/.vim/undofiles")
set udir=~/.vim/undofiles

set noshowmode
let g:lightline = {'colorscheme': 'powerlineish'}

colorscheme pitch_black

let g:rainbow#max_level = 256
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses

" better indent/dedent bindings
vnoremap < <gv
vnoremap > >gv

map <Leader>f :Neoformat<CR>
" TODO: config neoformat

autocmd BufEnter *.adn setfiletype clojure

map <Leader>c "+y
map <Leader>v "+P

" disables search highlighting until the next search is issued
map <Leader>s :nohl<CR><C-L>

" TODO: go up the dir hierarchy

" TODO: some asking maybe
map <Leader>t :w<CR>:make test<CR>
map <Leader>x :w<CR>:make<CR>
map <Leader>r :w<CR>:make run<CR>
map <Leader>i :w<CR>:make install<CR>

if(filereadable("Smfile"))
        set makeprg=sm
endif

if(filereadable("Justfile"))
        set makeprg=just
endif

if(filereadable("pack.toml"))
        autocmd BufWritePost * !packwiz refresh
endif

autocmd BufEnter *.rs set makeprg=cargo
autocmd BufEnter *.rs map <Leader>x :w<CR>:!cargo build<CR>

autocmd BufEnter *.swift set makeprg="PATH=/usr/bin swift"
autocmd BufEnter *.swift map <Leader>x :w<CR>:!PATH=/usr/bin swift build<CR>

autocmd BufEnter *.hs set makeprg=cabal
autocmd BufEnter *.hs map <Leader>x :w<CR>:!cabal build<CR>

autocmd BufEnter *.scad map <Leader>t :w<CR>:!openscad '%' -o `echo '%' \| sed 's/\.scad$/.stl/'` && `type xdg-open >/dev/null && echo xdg-open \|\| echo open` `echo '%' \| sed 's/\.scad$/.stl/'`<CR>

autocmd BufEnter *.svg map <Leader>t :w<CR>:!`type xdg-open >/dev/null && echo xdg-open \|\| echo open` '%'<CR>
" TODO: slim

" writing setup (named after ZERM)
map <Leader>z :set spell<CR>:set colorcolumn=0<CR><C-L>

map <Leader>T :exe "Tldr" input("Page: ")<CR>
map <Leader>F :Telescope find_files<CR><C-L>

map <Leader>d :ALEDetail<CR>

map <Leader>G :Git 
map <Leader>gc :Git commit -v<CR>
map <Leader>gp :Git push -v<CR>
map <Leader>gl :Git pull<CR>
map <Leader>gd :Git diff<CR>
map <Leader>gi :Git init<CR>
map <Leader>gs :Git status<CR>
map <Leader>gad :Git add -v 
map <Leader>gaa :Git add -vA<CR>
map <Leader>gap :Git add -vp<CR>

map <Leader>bn :bnext<CR><C-L>
map <Leader>bp :bprevious<CR><C-L>

":winc l<CR>
map <Leader>n :NERDTree<CR><C-L>

imap <C-a> <Home>
imap <C-e> <End>
imap <C-u> <Esc>cc
imap <C-k> <Esc>lC

vmap J :m >+1<CR>gv=gv
vmap K :m <-2<CR>gv=gv

" TODO: shortcut zum anmachen von markdown editing ohne makefile
