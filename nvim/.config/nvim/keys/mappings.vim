""" SPLITS
" Remap split navigation to <C-hjkl>.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Remap split size adjustments to <C-ArrowKeys>
noremap <M-j> :resize -2<CR>
noremap <M-k> :resize +2<CR>
noremap <M-h> :vertical resize +2<CR>
noremap <M-l> :vertical resize -2<CR>
" Change split windows from vert to horiz and horiz to vert.
map <Leader>tv <C-w>t<C-w>H
map <Leader>th <C-w>t<C-w>K


""" INTEGRATED TERMINAL
" Open terminal in a new vertical split.
noremap <silent> <Leader>tt :50vnew term://bash<CR>
" Use escape to enter normal mode from terminal mode.
tnoremap <Esc> <C-\><C-n>


""" OTHER
" Shortcut to toggle folds.
noremap <silent> zz zA
" Remaps of keybinds to move viewport up and down.
nnoremap <S-k> 3<C-y>
nnoremap <S-j> 3<C-e>
" Disable Ex mode.
nmap Q <Nop> 
" Clear search highlights on <Esc>.
nnoremap <silent> <Esc> :noh<CR><esc>
" Reload vim with the current configuration.
nnoremap <silent> <Leader>rv :source ~/.config/nvim/init.vim<CR>
" Write to protected files.
cmap w!! w !sudo tee > /dev/null %
" Toggle comments.
vmap co <plug>NERDCommenterToggle
nmap co <plug>NERDCommenterToggle
" Shortcuts for moving between hunks.
nmap <Leader>nh <Plug>(GitGutterNextHunk)
nmap <Leader>ph <Plug>(GitGutterPrevHunk)
" FZF mappings.
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Rg<CR>
nnoremap <Leader>fm :Marks<CR>


