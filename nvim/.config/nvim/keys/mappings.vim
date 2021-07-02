""" SPLITS
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


""" INTEGRATED TERMINAL
" Open terminal in a new vertical split.
noremap <silent> <Leader>tt :50vnew term://bash<CR>
" Use escape to enter normal mode from terminal mode.
tnoremap <Esc> <C-\><C-n>


""" COC
" Trigger completion.
inoremap <expr> <c-space> coc#refresh()
" Navigate diagnostics.
nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gy <Plug>(coc-type-definition)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <Leader>gr <Plug>(coc-references)
" Show documentation in preview window.
nnoremap <Leader>doc :call CoCShowDocumentation()<CR>
" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <Leader>fmt  <Plug>(coc-format-selected)
nmap <Leader>fmt  <Plug>(coc-format-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <Leader>qa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <Leader>qf  <Plug>(coc-fix-current)
" Organise imports of the current buffer.
nmap <Leader>oi  :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
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
" Toggle coc-explorer.
nnoremap <silent> <Leader>e :CocCommand explorer<CR>


""" OTHER
" Shortcut to toggle folds.
noremap <silent> zz za
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
" FZF mappings.
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Rg<CR>
nnoremap <Leader>fm :Marks<CR>
" Toggle comments.
vmap <Leader>/ <plug>NERDCommenterToggle
nmap <Leader>/ <plug>NERDCommenterToggle
" Move betwwen git hunks.
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)



