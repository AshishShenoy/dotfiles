" Install plugins in the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

	" A light and configurable statusline/tabline plugin for Vim.
	Plug 'itchyny/lightline.vim'

	" A fork of Rainbow Parentheses Improved by luo chen. 
	Plug 'frazrepo/vim-rainbow'

	" The NERDTree is a file system explorer for the Vim editor.
	Plug 'preservim/nerdtree'
        
        " A Git wrapper so awesome, it should be illegal.
        Plug 'tpope/vim-fugitive'

        " Vivid and high contrast colorscheme based on Monokai Pro.
        Plug 'sainnhe/sonokai'

        " A vim plugin that shows git diffs in the sign column. 
        Plug 'airblade/vim-gitgutter'

        " Nodejs extension host for Vim & Neovim.
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " A bright theme with pastel 'retro groove' colors and light/dark mode switching.
        Plug 'morhetz/gruvbox'

        " A plugin of NERDTree showing git status.
        Plug 'xuyuanp/nerdtree-git-plugin'

        " Adds file type icons to Vim plugins.
        Plug 'ryanoasis/vim-devicons'

        " Extra syntax and highlight for NERDTree files.
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

        " Fuzzy file finder for Vim.
        Plug 'ctrlpvim/ctrlp.vim'

        " Comment functions so powerful—no comment necessary.
        Plug 'preservim/nerdcommenter'

        " Sync currently open file with NERDTree.
        Plug 'unkiwii/vim-nerdtree-sync'

        " Syntax highlighting for Octave files.
        Plug 'tranvansang/octave.vim'

call plug#end()

""""" LIGHTLINE """""
" Do not use the default show mode
" Replaced by lightline
set noshowmode

" Change the colorscheme of lightline.
let g:lightline = { 'colorscheme': 'wombat', }


"""""" COC """"""
" Map F2 to rename symbol.
nmap <F2> <Plug>(coc-rename)


"""""" VIM-RAINBOW """"""
" Enable vim-rainbow for all files.
let g:rainbow_active = 1


"""""" NERDTREE """"""
" Set symbols for closed and open folders.
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

"" Shortcut to toggle NERDTree.
nnoremap <C-n> :NERDTreeToggle<CR>

" Ignore list for NERDTree.
let NERDTreeLignore=['^.git$', '^node_modules$']

" Show hidden files.
let NERDTreeShowHidden = 1

" Disable the help text.
let NERDTreeMinimalUI = 1

" Set size of the sidebar in columns.
let g:NERDTreeWinSize = 30


""""" SONOKAI """"""
" Change sonokai style.
let g:sonokai_style='atlantis'


""""" GITGUTTER """"""
" Change Signs Column background color to transparent.
highlight SignColumn ctermbg=NONE


" Refresh gutter every 250 milliseconds.
set updatetime=250


""""" CTRLP """""
" Set working directory of the directory of the current file.
let g:ctrlp_working_path_mode = 'ca'


"""""" NERDCommentor """"""
" Toggle comment state in both normal and visual mode.
vmap co <plug>NERDCommenterToggle
nmap co <plug>NERDCommenterToggle

" Add spaces after comment characters.
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

