let g:sneak#label = 1

" Case insensitive sneak.
let g:sneak#use_ic_scs = 1

" Immediately move to the next instance of search, if you move the cursor sneak is back to default behavior.
let g:sneak#s_next = 1

let g:sneak#prompt = '🔎 '

highlight Sneak ctermfg=black ctermbg=cyan
highlight SneakScope ctermfg=red ctermbg=yellow
