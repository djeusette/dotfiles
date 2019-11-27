" Get logs
" let g:neomake_verbose=3

" Run Neomake when I save any buffer
augroup localneomake
  autocmd! BufWritePost * Neomake
augroup END

" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []

" Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
" let g:neomake_elixir_enabled_makers = ['mycredo']
" function! NeomakeCredoErrorType(entry)
"   if a:entry.type ==# 'F'      " Refactoring opportunities
"     let l:type = 'W'
"   elseif a:entry.type ==# 'D'  " Software design suggestions
"     let l:type = 'I'
"   elseif a:entry.type ==# 'W'  " Warnings
"     let l:type = 'W'
"   elseif a:entry.type ==# 'R'  " Readability suggestions
"     let l:type = 'I'
"   elseif a:entry.type ==# 'C'  " Convention violation
"     let l:type = 'W'
"   else
"     let l:type = 'M'           " Everything else is a message
"   endif
"   let a:entry.type = l:type
" endfunction

" let g:neomake_elixir_mycredo_maker = {
"       \ 'exe': 'mix',
"       \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
"       \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
"       \ 'postprocess': function('NeomakeCredoErrorType')
"       \ }
