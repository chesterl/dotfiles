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
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
" Required for auto indent when pressing enter
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

set number
set statusline+=%F
set history=20

" Jump 5 lines when hit end/top of page
set scrolljump=5

" Set up 2 space tabbing and indenting
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab

set backspace=indent,eol,start  " Allow backspace in insert mode
set autoread                    " Reload files changed outside vim"
set laststatus=2                " Always show status line
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window

" Search setting
set hlsearch         " Highlight searches by default


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

" Strip whitespace on save
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre *.rb,*.js,*.html,*.erb :call <SID>StripTrailingWhitespaces()

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

" Save shortcuts
" Does not work
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a

" Nerd Tree shortcut
let mapleader = ","
nmap <leader>nt :NERDTree<cr>

" Source shortcut
map <leader>rr :source ~/.vimrc<CR>

" ctrlp config
let g:ctrlp_max_height = 16
let g:ctrlp_custom_ignore = ''
let g:ctrlp_custom_ignore .= '/\..*/\|'
let g:ctrlp_custom_ignore .= '/tmp/\|'
let g:ctrlp_custom_ignore .= '/dist/\|'
let g:ctrlp_custom_ignore .= '/node_modules/\|'
let g:ctrlp_custom_ignore .= '/plugins/\|'
let g:ctrlp_custom_ignore .= 'REGEX_TERMINATOR'

" Copy current buffer path relative to root of VIM session to system clipboard
nnoremap <Leader>yp :let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>
" Copy current filename to system clipboard
nnoremap <Leader>yf :let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>
" Copy current buffer path without filename to system clipboard
nnoremap <Leader>yd :let @*=expand("%:h")<cr>:echo "Copied file directory to clipboard"<cr>

" Send rspec to tmux
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
