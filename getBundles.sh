#!/bin/bash

echo starting vim plugin git clone...
cd ~/.vim/bundle

# Jedi : Using the jedi autocompletion library for VIM
git clone --recursive https://github.com/davidhalter/jedi-vim.git

# Command-t
git clone --recursive https://github.com/wincent/command-t.git

# python-mode : Vim python-mode.  PyLint, Rope, Pydoc, breakpoints from box
git clone --recursive https://github.com/klen/python-mode.git

# SuperTab : Perform all your vim insert mode completions with Tab
git clone --recursive https://github.com/ervandew/supertab.git

# vim-git : Vim Git runtime files
git clone --recursive https://github.com/tpope/vim-git.git

# vim-makegreen : MakeGreen runs make and shows a red or green message bar for success/failure. Speeds the red-green-refactor cycle
git clone --recursive https://github.com/reinh/vim-makegreen.git

# gundo : Vim plugin to visualize your Vim undo tree
git clone --recursive https://github.com/sjl/gundo.vim.git

# pep8 : Simple Python style checker in one Python file
git clone --recursive https://github.com/jcrocholl/pep8.git

# nerdtree : A tree explorer plugin for vim
git clone --recursive https://github.com/scrooloose/nerdtree.git

# vim-kolor : Vim color scheme 
git clone --recursive https://github.com/zeis/vim-kolor.git

# vim-surround : quoting/parenthesizing made simple
git clone --recursive https://github.com/tpope/vim-surround.git

# solarized : A proper color scheme
git clone --recursive  https://github.com/altercation/vim-colors-solarized.git

echo Complete.
