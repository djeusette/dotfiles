nnoremap <Leader>o :Files<CR>
nnoremap \ :Rg<SPACE>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color=always --glob "!.git/*" '.shellescape(<q-args>), 1, <bang>0)

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
