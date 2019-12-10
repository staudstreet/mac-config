" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
filetype plugin indent on    " required

Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/itchyny/lightline.vim'
Plugin 'https://github.com/Valloric/MatchTagAlways'
Plugin 'bassburner/vim-colors-glacier'

call vundle#end()

" BASICS
set nocompatible	" be iMproved, required
filetype off		" required
syntax enable		" enable syntax processing

" UI
set mouse=a		" enables mouse
set number		" show line numbers
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set cursorline          " highlight current line
set backspace=indent,eol,start

" COLORS
set background=dark	" set background color
colorscheme glacier

" SEARCH
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
