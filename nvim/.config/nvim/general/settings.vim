let g:mapleader = ','

""" CORE
set number relativenumber
set noswapfile
set cursorline
set ignorecase smartcase
set clipboard=unnamedplus
set signcolumn=yes
set hidden
set pumheight=10
set cmdheight=2
set splitbelow splitright
set updatetime=250
set undofile
set noshowmode

" Disable line numbers in integrated terminal.
augroup TerminalStuff
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

