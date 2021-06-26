" Auto-install vim-plug
if empty(glob('~/.local/share/nvim/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Install plugins in the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

        " Insert or delete brackets, parens, quotes in pair.
        Plug 'jiangmiao/auto-pairs'

        " Black is the uncompromising Python code formatter.
        Plug 'psf/black'

        " Nodejs extension host for Vim & Neovim.
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " Expand emmet abbreviations.
        Plug 'mattn/emmet-vim'

        " Fuzzy finder for vim.
        Plug 'junegunn/fzf'
        Plug 'junegunn/fzf.vim'

	" A light and configurable statusline/tabline plugin for Vim.
	Plug 'itchyny/lightline.vim'

        " Comment functions so powerful—no comment necessary.
        Plug 'preservim/nerdcommenter'

        " A Git wrapper so awesome, it should be illegal.
        Plug 'tpope/vim-fugitive'

        " A vim plugin that shows git diffs in the sign column. 
        Plug 'airblade/vim-gitgutter'

        " JavaScript bundle, provides syntax highlighting.
        Plug 'pangloss/vim-javascript'

        " The React syntax highlighting and indenting plugin for vim.
        Plug 'maxmellon/vim-jsx-pretty'

	" A fork of Rainbow Parentheses Improved by luo chen. 
	Plug 'frazrepo/vim-rainbow'

        " Changes pwd to project root upon opening a file.
        Plug 'airblade/vim-rooter'

        " Themes
        Plug 'sainnhe/sonokai'
        Plug 'joshdick/onedark.vim'

call plug#end()

