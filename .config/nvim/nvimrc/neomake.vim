" Get logs
" let g:neomake_verbose=3

let g:neomake_open_list = 2
let g:neomake_list_height = 10

" Run Neomake when I save any buffer and 1 sec
" after I open one
call neomake#configure#automake('rw', 1000)

let g:neomake_elixir_enabled_makers = ['credo']

" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []

