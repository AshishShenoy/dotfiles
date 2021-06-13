" Install plugins in the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

        " Black is the uncompromising Python code formatter.
        Plug 'psf/black'

        " Nodejs extension host for Vim & Neovim.
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " Fuzzy file finder for Vim.
        Plug 'ctrlpvim/ctrlp.vim'

        " Expand emmet abbreviations.
        Plug 'mattn/emmet-vim'

        " A bright theme with pastel 'retro groove' colors and light/dark mode switching.
        Plug 'morhetz/gruvbox'

	" A light and configurable statusline/tabline plugin for Vim.
	Plug 'itchyny/lightline.vim'

        " Comment functions so powerful—no comment necessary.
        Plug 'preservim/nerdcommenter'

	" The NERDTree is a file system explorer for the Vim editor.
	Plug 'preservim/nerdtree'

        " A plugin of NERDTree showing git status.
        Plug 'xuyuanp/nerdtree-git-plugin'

        " Vivid and high contrast colorscheme based on Monokai Pro.
        Plug 'sainnhe/sonokai'

        " Adds file type icons to Vim plugins.
        Plug 'ryanoasis/vim-devicons'
        
        " A Git wrapper so awesome, it should be illegal.
        Plug 'tpope/vim-fugitive'

        " A vim plugin that shows git diffs in the sign column. 
        Plug 'airblade/vim-gitgutter'

        " JavaScript bundle, provides syntax highlighting.
        Plug 'pangloss/vim-javascript'

        " The React syntax highlighting and indenting plugin for vim.
        Plug 'maxmellon/vim-jsx-pretty'

        " Extra syntax and highlight for NERDTree files.
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	" A fork of Rainbow Parentheses Improved by luo chen. 
	Plug 'frazrepo/vim-rainbow'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" => BLACK
""""""""""""""""""""""""""""""""""""""""""""""""""
" Run black on save
autocmd BufWritePre *.py execute ':Black'


""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-clangd',
    \ 'coc-snippets',
    \ 'coc-vimlsp',
    \ 'coc-pyright',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-eslint'
\ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation in preview window.
nnoremap <leader>doc :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>do  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRLP
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set working directory of the directory of the current file.
let g:ctrlp_working_path_mode = 'ca'


""""""""""""""""""""""""""""""""""""""""""""""""""
" => LIGHTLINE
""""""""""""""""""""""""""""""""""""""""""""""""""
" Replace default show mode by lightline.
set noshowmode

" Change the colorscheme of lightline.
let g:lightline = { 'colorscheme': 'one', }


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


""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTREE
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set symbols for closed and open folders.
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

"" Shortcut to toggle NERDTree.
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Ignore list for NERDTree.
let NERDTreeIgnore=['^.git$', '^node_modules$']

" Show hidden files.
let NERDTreeShowHidden = 1

" Disable the help text.
let NERDTreeMinimalUI = 1

" Set size of the sidebar in columns.
let g:NERDTreeWinSize = 30


""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-GITGUTTER
""""""""""""""""""""""""""""""""""""""""""""""""""
" Change Signs Column background color to transparent.
highlight SignColumn ctermbg=NONE

" Refresh gutter every 250 milliseconds.
set updatetime=250

" Shortcuts for moving between hunks.
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-RAINBOW
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable vim-rainbow for certain filetypes.
au FileType c,cpp,javascript,typescript,python call rainbow#load()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => COLORSCHEMES
""""""""""""""""""""""""""""""""""""""""""""""""""
" Change sonokai style.
let g:sonokai_style='atlantis'

colorscheme sonokai


