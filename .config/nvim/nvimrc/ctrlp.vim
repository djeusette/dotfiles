" Open file menu
" nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" Open Tag menu
" nnoremap <Leader>. :CtrlPTag<CR>

if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --glob "!.git/*"'
  let g:ctrlp_use_caching = 0
endif
