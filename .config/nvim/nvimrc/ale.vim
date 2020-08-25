let g:ale_fixers = {
\ 'elixir': ['mix_format'],
\ 'javascript': ['prettier', 'eslint'],
\ 'typescript': ['prettier', 'eslint'],
\ 'css': ['prettier'],
\ 'json': ['prettier'],
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_linters = {}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_disable_lsp = 1
