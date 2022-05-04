#!/bin/sh
set -uxe

cp -f vimrc ~/.vimrc
mkdir -p ~/.config/nvim
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc' > ~/.config/nvim/init.vim

mkdir -p ~/.vim/pack/git-plugins/start
cd ~/.vim/pack/git-plugins/start

for p in \
        dense-analysis/ale \
        prabirshrestha/async.vim \
        skywind3000/asyncrun.vim \
        neoclide/coc.nvim \
        vim-denops/denops.vim \
        lambdalisue/askpass.vim \
        skanehira/denops-docker.vim \
        lambdalisue/guise.vim \
        editorconfig/editorconfig-vim \
        itchyny/lightline.vim \
        iamcco/markdown-preview.nvim \
        sbdchd/neoformat \
        preservim/nerdtree \
        wlemuel/vim-tldr \
        itchyny/vim-cursorword \
        tpope/vim-fugitive \
        sirtaj/vim-openscad \
        tpope/vim-rhubarb \
        junegunn/vim-github-dashboard \
        jaxbot/github-issues.vim \
        vim-utils/vim-man \
        pest-parser/pest.vim \
        nvim-lua/plenary.nvim \
        segeljakt/vim-silicon \
        nvim-telescope/telescope.nvim
do
        [ -d $(echo $p | cut -d/ -f2) ] || \
                git clone --recurse-submodules --verbose https://github.com/$p.git
done

cd coc.nvim
yarn install
