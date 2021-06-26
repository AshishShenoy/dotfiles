" Change the colorscheme of lightline.
let g:lightline = { 'colorscheme': 'one', }

" Add spaces after comment characters.
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Change Signs Column background color of gutter to transparent.
highlight SignColumn ctermbg=NONE

" Enable vim-rainbow for certain filetypes.
au FileType c,cpp,javascript,typescript,python call rainbow#load()

" Disable  pair rearranging on CR.
let g:AutoPairsMapCR=0

