""" INDENTATION AND FOLDING
set softtabstop=4
set expandtab
set shiftwidth=4
set smartindent autoindent
set foldmethod=indent
" Fold only outer functions.
set foldlevel=99


""" SYNTAX HIGHLIGHTING
" Change syntax highlighting by file extension.
au BufNewFile,BufRead,BufReadPost *.y set syntax=c
au BufNewFile,BufRead,BufReadPost *.js set syntax=javascriptreact
au BufNewFile,BufRead,BufReadPost *.jsx set syntax=javascriptreact
au BufNewFile,BufRead,BufReadPost *.ts set syntax=javascriptreact
au BufNewFile,BufRead,BufReadPost *.tsx set syntax=javascriptreact


""" FORMATTING AND LINTING
" Run black on save
autocmd BufWritePre *.py execute ':Black'

