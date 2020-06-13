set textwidth=98
set colorcolumn=+1

" Make sure cursorline and cursorcolumn are enabled at startup
set cursorline
set cursorcolumn

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" More normal Vim tweaks.
" vertical: make a diff split vertical by default
" iwhite: ignore whitespace
" context: show 15 lines of context
set diffopt=filler,vertical,context:15
let g:html_diff_one_file = 1

colorscheme jellybeans

if (has("termguicolors"))
  set termguicolors
endif

" set linenumbers on by default
" When in insert mode, show linear numbers
" When not in insert mode, show current line number with relative numbers
" And last of all, only be relative in the buffer we're editing.
set number

au InsertLeave * set number
au InsertLeave * set relativenumber

au InsertLeave * set number
au InsertEnter * set norelativenumber

au BufLeave,FocusLost,WinLeave * set norelativenumber
" au BufLeave,FocusLost,WinLeave * set number
au BufEnter,FocusGained,WinEnter * set relativenumber

" A cleaner vertical split
set fillchars=vert:\|

" Only use cursorline/cursorcolumn in normal mode
autocmd InsertLeave * :set cursorline
autocmd InsertLeave * :set cursorcolumn

autocmd InsertEnter * :set nocursorline
autocmd InsertEnter * :set nocursorcolumn

syntax enable

" Change the cursorcolumn ctermbg color
highlight CursorColumn ctermbg=235
