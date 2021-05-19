""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core Experience
""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber
set noswapfile

" Highlight the current line.
set cursorline

" Emable case insensitive searching, except for searches with uppercase
" characters.
set ignorecase smartcase

" Change the leader key from default '/' to ','.
let mapleader = ','

" Automatically change the directory to the file in the current buffer.
set autochdir

" Turn on the filetype plugin for filetype specific actions.
filetype plugin on

" Unify vim and OS clipboard.
set clipboard=unnamedplus

" Always display the sign column.
set signcolumn=yes


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits
"""""""""""""""""""""""""""""""""""""""""""""""""
" Change default positions of new splits to below(horiz) and right(vert).
set splitbelow splitright

" Remap split navigation to <C-hjkl>.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap split size adjustments to <C-ArrowKeys>
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change split windows from vert to horiz and horiz to vert.
map <Leader>tv <C-w>t<C-w>H
map <Leader>th <C-w>t<C-w>K

" Make the split border transparent.
highlight VertSplit cterm=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Integrated Terminal
""""""""""""""""""""""""""""""""""""""""""""""""""
" Open terminal in a new vertical split.
noremap <silent> <Leader>tt :50vnew term://bash<CR>

" Disable line numbers in integrated terminal.
augroup TerminalStuff
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Use escape to enter normal mode from terminal mode.
tnoremap <Esc> <C-\><C-n>


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undofile and Undodir
""""""""""""""""""""""""""""""""""""""""""""""""""
" Create undodir if it doesn't exist.
if !isdirectory($HOME . "/.local/share/nvim/undodir")
	call mkdir($HOME . "/.local/share/nvim/undodir", "p")
endif
set undofile
set undodir=~/.local/share/nvim/undodir


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable Annoyances
""""""""""""""""""""""""""""""""""""""""""""""""""
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop> 

" Clear search highlights on <Esc>
nnoremap <silent> <Esc> :noh<CR><esc>

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set equivalent number of spaces for a tab.
set softtabstop=4

" Automatically convert tabs to spaces.
set expandtab

" Number of spaces to be used for reindenting (<< and >>).
set shiftwidth=4


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""
" Remaps of keybinds to move viewport up and down.
nnoremap <S-k> 3<C-y>
nnoremap <S-j> 3<C-e>

" Reload vim with the current configuration.
nnoremap <silent> <Leader>rv :source ~/.config/nvim/init.vim<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Change syntax highlighting of Bison files to C.
au BufNewFile,BufRead,BufReadPost *.y set syntax=c


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins and their configurations.
source ~/.config/nvim/plugins.vim

