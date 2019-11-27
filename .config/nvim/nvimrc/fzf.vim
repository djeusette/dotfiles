nnoremap <Leader>o :Files<CR>
nnoremap \ :Rg<SPACE>

command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color=always --glob "!.git/*" '.shellescape(<q-args>), 1, <bang>0)
