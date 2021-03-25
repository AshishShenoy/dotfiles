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

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" => LIGHTLINE
""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not use the default show mode
" Replaced by lightline
set noshowmode

" Change the colorscheme of lightline.
let g:lightline = { 'colorscheme': 'wombat', }


""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC
""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Shortcut to show documentation in preview window
nnoremap <silent> <C-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <Leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <Leader>fmt  <Plug>(coc-format-selected)
nmap <Leader>fmt  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-RAINBOW
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable vim-rainbow for all files.
let g:rainbow_active = 1


""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTREE
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set symbols for closed and open folders.
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

"" Shortcut to toggle NERDTree.
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Ignore list for NERDTree.
let NERDTreeLignore=['^.git$', '^node_modules$']

" Show hidden files.
let NERDTreeShowHidden = 1

" Disable the help text.
let NERDTreeMinimalUI = 1

" Set size of the sidebar in columns.
let g:NERDTreeWinSize = 30


""""""""""""""""""""""""""""""""""""""""""""""""""
" => SONOKAI
""""""""""""""""""""""""""""""""""""""""""""""""""
" Change sonokai style.
let g:sonokai_style='atlantis'


""""""""""""""""""""""""""""""""""""""""""""""""""
" => GRUVBOX
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox


""""""""""""""""""""""""""""""""""""""""""""""""""
" => GITGUTTER
""""""""""""""""""""""""""""""""""""""""""""""""""
" Change Signs Column background color to transparent.
highlight SignColumn ctermbg=NONE

" Refresh gutter every 250 milliseconds.
set updatetime=250


""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRLP
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set working directory of the directory of the current file.
let g:ctrlp_working_path_mode = 'ca'


""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCOMMENTER
""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle comment state in both normal and visual mode.
vmap co <plug>NERDCommenterToggle
nmap co <plug>NERDCommenterToggle

" Add spaces after comment characters.
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

