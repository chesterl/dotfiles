set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'

call vundle#end()
" Required for auto indent when pressing enter
filetype plugin indent on

syntax enable
:set number
:set statusline+=%F

" Jump 5 lines when hit end/top of page
:set scrolljump=5

" Set up 2 space tabbing and indenting
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab

" NERDtree - autoopen
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDtree mapping
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"

" Fix NERDtree mapping conflict
let g:NERDTreeDirArrows=0

" Highligh trailing white spaces on non-insert mode
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Delete trailing white space and Dos-returns and to expand tabs to spaces
noremap <F2> :set et<CR>:retab!<CR>:%s/[\r \t]\+$//<CR>

" Allow navigation with Ctrl + direction with multi window
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" resize current buffer by +/- 5
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>

" Leader shortcuts
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a

" Nerd Tree shortcut
let mapleader = ","
nmap <leader>nt :NERDTree<cr>
