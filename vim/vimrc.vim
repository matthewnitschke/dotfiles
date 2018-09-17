set nocompatible              " be iMproved, required
filetype off                  " required

syntax on     " enable syntax highlighting
set mouse=a   " enable mouse 
set autoindent
set number
set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Valloric/YouCompleteMe'

" Plugin 'joshdick/onedark.vim'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required
