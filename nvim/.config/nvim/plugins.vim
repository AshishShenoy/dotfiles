" Install plugins in the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

	" A light and configurable statusline/tabline plugin for Vim.
	Plug 'itchyny/lightline.vim'

	" A fork of Rainbow Parentheses Improved by luo chen. 
	Plug 'frazrepo/vim-rainbow'

	" The NERDTree is a file system explorer for the Vim editor.
	Plug 'preservim/nerdtree'

call plug#end()

" Do not use the default show mode
" Replaced by lightline
set noshowmode

" Change the colorscheme of lightline.
let g:lightline = { 'colorscheme': 'wombat', }

" Enable vim-rainbow for all files.
let g:rainbow_active = 1

