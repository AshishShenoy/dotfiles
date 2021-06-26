let g:mapleader = ','

syntax enable
filetype plugin on

""" CORE
set background=dark
set number relativenumber
set noswapfile
set cursorline
set ignorecase smartcase
set clipboard=unnamedplus
set signcolumn=yes
set hidden
set pumheight=10
set cmdheight=2
set mouse=a
set nobackup
set nowritebackup
set splitbelow splitright
set noerrorbells visualbell
set updatetime=250
set noshowmode

" Make the split border transparent.
highlight VertSplit cterm=NONE

" Disable line numbers in integrated terminal.
augroup TerminalStuff
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END


""" UNDOFILE AND UNDODIR
" Create undodir if it doesn't exist.
if !isdirectory($HOME . "/.local/share/nvim/undodir")
	call mkdir($HOME . "/.local/share/nvim/undodir", "p")
endif
set undofile
set undodir=~/.local/share/nvim/undodir

