""" INDENTATION AND FOLDING
set softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set foldmethod=indent
set foldlevel=99


""" SYNTAX HIGHLIGHTING
" Change syntax highlighting by file extension.
au BufNewFile,BufRead,BufReadPost *.js set syntax=typescript
au BufNewFile,BufRead,BufReadPost *.jsx set syntax=typescript
au BufNewFile,BufRead,BufReadPost *.ts set syntax=typescript
au BufNewFile,BufRead,BufReadPost *.tsx set syntax=typescript

