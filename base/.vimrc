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

if(filereadable("Makefile"))
        map <Leader>t :w<CR>:make test<CR>
        map <Leader>x :w<CR>:make<CR>
        map <Leader>r :w<CR>:make run<CR>
        map <Leader>i :w<CR>:make install<CR>
endif

if(filereadable("Smfile"))
        map <Leader>t :w<CR>:!sm test<CR>
        map <Leader>x :w<CR>:!sm<CR>
        map <Leader>r :w<CR>:!sm run<CR>
        map <Leader>i :w<CR>:!sm install<CR>
endif

if(filereadable("Justfile"))
        map <Leader>t :w<CR>:!just test<CR>
        map <Leader>x :w<CR>:!just build<CR>
        map <Leader>r :w<CR>:!just run<CR>
        map <Leader>i :w<CR>:!just install<CR>
endif

if(filereadable("pack.toml"))
        autocmd BufWritePost * !packwiz refresh
endif

autocmd BufEnter *.rs map <Leader>t :w<CR>:!cargo test<CR>
autocmd BufEnter *.rs map <Leader>x :w<CR>:!cargo build<CR>
autocmd BufEnter *.rs map <Leader>r :w<CR>:!cargo run<CR>
autocmd BufEnter *.rs map <Leader>i :w<CR>:!cargo install<CR>

autocmd BufEnter *.swift map <Leader>t :w<CR>:!PATH=/usr/bin swift test<CR>
autocmd BufEnter *.swift map <Leader>x :w<CR>:!PATH=/usr/bin swift build<CR>
autocmd BufEnter *.swift map <Leader>r :w<CR>:!PATH=/usr/bin swift run<CR>
autocmd BufEnter *.swift map <Leader>i :w<CR>:!PATH=/usr/bin swift install<CR>

autocmd BufEnter *.hs map <Leader>t :w<CR>:!cabal test<CR>
autocmd BufEnter *.hs map <Leader>x :w<CR>:!cabal build<CR>
autocmd BufEnter *.hs map <Leader>r :w<CR>:!cabal run<CR>
autocmd BufEnter *.hs map <Leader>i :w<CR>:!cabal install<CR>

autocmd BufEnter *.scad map <Leader>t :w<CR>:!openscad '%' -o `echo '%' \| sed 's/\.scad$/.stl/'` && `type xdg-open >/dev/null && echo xdg-open \|\| echo open` `echo '%' \| sed 's/\.scad$/.stl/'`<CR>

autocmd BufEnter *.svg map <Leader>t :w<CR>:!open %<CR>

" writing setup (named after ZERM)
map <Leader>z :set spell<CR>:set colorcolumn=0<CR><C-L>

map <Leader>T :exe "Tldr" input("Page: ")<CR>
map <Leader>F :Telescope find_files<CR><C-L>

map <Leader>d :ALEDetail<CR>

" TODO: think about the usage of `input`
map <Leader>G :exe "Git" input("Command: ")<CR>
map <Leader>gc :Git commit -v<CR>
map <Leader>gp :Git push -v<CR>
map <Leader>gl :Git pull<CR>
map <Leader>gd :Git diff<CR>
map <Leader>gi :Git init<CR>
map <Leader>gs :Git status<CR>
map <Leader>gad :exe "Git add -v" input("File(s): ")<CR>
map <Leader>gaa :Git add -vA<CR>
map <Leader>gap :Git add -vp<CR>

map <Leader>bn :bnext<CR><C-L>
map <Leader>bp :bprevious<CR><C-L>

":winc l<CR>
map <Leader>n :NERDTree<CR><C-L>

" TODO: shortcut zum anmachen von markdown editing ohne makefile
